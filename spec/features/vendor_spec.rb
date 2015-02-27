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
    fill_in 'vendor_name', with: vendor.name
    click_button 'Neu Anlegen'
  end

  it 'allows to change vendors' do
    visit ("/vendors/#{vendor.id}/edit")
    fill_in 'vendor_name', with: 'Amazon'
    click_button 'Speichern'
    visit("/vendors/#{vendor.id}")
    expect(page).to have_content 'Amazon'
  end

  it 'allows to show vendors' do
    visit ("/vendors/#{vendor.id}")
    expect(page).to have_content vendor.name
    expect(page).to have_content ('Händler Details')
  end

  it 'allows to go back to vendors' do
    visit ("/vendors/#{vendor.id}")
    click_button('Zurück')
    expect(page).to have_content vendor.name
    expect(page).to have_content ('Händler')
  end
end