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
    expect(page).to have_content 'Zahlungsmethode'
  end


  it 'allows to mount new payments' do
    fill_in 'payment_name', with: payment.name
    fill_in 'payment_number', with: payment.number
    fill_in 'payment_bic', with: payment.bic

    expect { click_button 'Speichern' }.to change {Payment.count}.by(1)
    expect(page).to have_content payment.name
    expect(page).to have_content payment.number
    expect(page).to have_content payment.bic
    expect(page).to have_css('.fa-check')
  end
end