require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }
    it 'allows to sign in' do
      visit root_path
      click_link 'Login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Spacken123'
      click_button 'Sign in'

      expect(page).to have_content user.first_name
    end
    it 'allows to sign out' do
      visit root_path
      click_link 'Login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Spacken123'
      click_button 'Sign in'
      expect(page).to have_content user.first_name

      click_link 'Logout'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Login'
    end
  end
end