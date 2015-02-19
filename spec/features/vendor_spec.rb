require 'rails_helper'

describe 'Vendor' do
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
    expect(page).to have_content 'New vendor'
  end


  it 'allows to mount new vendors' do
    fill_in 'vendor_name', with: 'REWE'
    expect { click_button 'Create Vendor' }.to change {Vendor.count}.by(1)

    expect(page).to have_content 'REWE'
  end
end