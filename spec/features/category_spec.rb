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
    expect(page).to have_content 'Kategorie'
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice
    click_button 'Speichern'
  end

  it 'allows to change category name' do
    visit ("/categories/#{category.id}/edit")
    fill_in 'category_name', with: 'Lebensmittel123'
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_content 'Lebensmittel123'
  end

  it 'allows to change category income' do
    visit ("/categories/#{category.id}/edit")
    check('category_income')
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_css('.fa-plus')
    expect(page).to_not have_css('.fa-minus')
    visit ("/categories/#{category.id}/edit")
    uncheck('category_income')
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_css('.fa-minus')
    #expect(page).to_not have_css('.fa-plus')
  end

  it 'allows to change category active' do
    visit ("/categories/#{category.id}/edit")
    check('category_active')
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_css('.fa-check')
    expect(page).to_not have_css('.fa-times')
    visit ("/categories/#{category.id}/edit")
    uncheck('category_active')
    click_button 'Speichern'
    visit("/categories/#{category.id}")
    expect(page).to have_css('.fa-times')
    expect(page).to_not have_css('.fa-check')
  end

  it 'allows to show categories' do
    visit ("/categories/#{category.id}")
    expect(page).to have_content category.name
    expect(page).to have_content ('Kategorie Details')
  end
end