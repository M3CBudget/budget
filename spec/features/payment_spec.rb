require 'rails_helper'

describe 'Payment' do
  before(:each) do
    visit root_path
    click_link 'Sign up'
    fill_in 'user_first_name', with: 'Dieter'
    fill_in 'user_last_name', with: 'Müller'
    fill_in 'user_email', with: 'hallo@gmx.de'
    fill_in 'user_password', with: 'Spacken123'
    fill_in 'user_password_confirmation', with: 'Spacken123'
    click_button 'Sign up'

    visit ('/payments/new')
    expect(page).to have_content 'New payment'
  end


  it 'allows to mount new payments' do
    fill_in 'payment_name', with: 'Giro'
    check('payment_active')
    fill_in 'payment_account_id', with: 1

    expect { click_button 'Create Payment' }.to change {Payment.count}.by(1)

    expect(page).to have_content 'Giro'
  end
end