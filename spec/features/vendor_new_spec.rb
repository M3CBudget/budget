require 'rails_helper'

describe 'Vendor' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:vendor) { FactoryGirl.create(:vendor) }
  before(:each) do
    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Spacken123'
    click_button 'Sign in'

    visit ('/vendors/new')
    expect(page).to have_content 'Händler'
  end

  it 'allows to mount new vendors' do
    fill_in 'vendor_name', with: vendor.name

    expect { click_button 'Neu Anlegen' }.to change {Vendor.count}.by(1)
    expect(page).to have_content vendor.name
  end
end