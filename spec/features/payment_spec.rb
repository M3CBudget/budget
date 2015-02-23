require 'rails_helper'

describe 'Payment' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:payment) { FactoryGirl.create(:payment) }
  before(:each) do
    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Spacken123'
    click_button 'Sign in'

    visit ('/payments/new')
    expect(page).to have_content 'Zahlungsmethode anlegen'
    fill_in 'payment_name', with: payment.name
    fill_in 'payment_number', with: payment.number
    fill_in 'payment_bic', with: payment.bic
    click_button 'Speichern'
    expect(page).to have_content payment.name
  end

  it 'allows to change payments' do
    visit ("/payments/#{payment.id}/edit")
    fill_in 'payment_name', with: 'Kreditkarte'
    click_button 'Speichern'
    visit("/payments/#{payment.id}")
    expect(page).to have_content 'Kreditkarte'
  end
end