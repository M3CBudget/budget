require 'rails_helper'

describe 'Sign in' do
  context 'existing user' do
    let!(:user) { FactoryGirl.create(:user) }
    it 'allows to sign in' do
      visit root_path
      click_link 'Sign in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Spacken123'
      click_button 'Sign in'

      expect(page).to have_content user.email
    end
    it 'allows to sign out' do
      visit root_path
      click_link 'Sign in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'Spacken123'
      click_button 'Sign in'

      click_link 'Sign out'

      expect(page).to_not have_content user.email
      expect(page).to have_content 'Sign in'
    end
  end
end