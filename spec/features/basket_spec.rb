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

    visit ('/vendors/new')
    fill_in 'vendor_name', with: 'REWE'
    click_button 'Create Vendor'
    visit ('/baskets/new')
    expect(page).to have_content 'New basket'
  end


  it 'allows to mount new baskets' do
    fill_in 'basket_notice', with: 'Hallo'
    fill_in 'basket_amount', with: 2.69
    fill_in 'basket_user_id', with: 1
    fill_in 'basket_payment_id', with: 1
    fill_in 'basket_items_attributes_0_name', with: 'Milch'
    fill_in 'basket_items_attributes_0_price', with: 0.59
    fill_in 'basket_items_attributes_0_quantity', with: 2

    expect { click_button 'Create Basket' }.to change {Basket.count}.by(1)

    expect(page).to have_content 'Hallo'
  end
end