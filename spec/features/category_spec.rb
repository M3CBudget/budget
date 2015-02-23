require 'rails_helper'

describe 'Category' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  before(:each) do
    visit root_path

    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Spacken123'
    click_button 'Sign in'
    visit ('/categories/new')
    expect(page).to have_content 'Kategorie Hinzufügen'
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice
    click_button 'Speichern'
  end

  it 'allows to change categories' do
    visit ("/categories/#{category.id}/edit")
    fill_in 'category_name', with: 'Lebensmittel123'
    check('category_income')
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_content 'Lebensmittel123'

  end

  it 'allows to delete categories' do

    visit ('/categories/')
    find_button('Löschen').click

  end
end