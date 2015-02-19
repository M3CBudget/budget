require 'rails_helper'

describe 'Category' do
  before(:each) do
      visit root_path
      click_link 'Sign up'
      fill_in 'user_first_name', with: 'Dieter'
      fill_in 'user_last_name', with: 'Müller'
      fill_in 'user_email', with: 'hallo@gmx.de'
      fill_in 'user_password', with: 'Spacken123'
      fill_in 'user_password_confirmation', with: 'Spacken123'
      click_button 'Sign up'

      visit ('/categories/new')
      expect(page).to have_content 'New category'
  end


  it 'allows to mount new categories' do
    fill_in 'category_name', with: 'Food'
    fill_in 'category_notice', with: 'Something to eat'
    check('category_active')

    expect { click_button 'Create Category' }.to change {Category.count}.by(1)

    expect(page).to have_content 'Food'
  end
end