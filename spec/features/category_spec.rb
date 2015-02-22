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
  end


  it 'allows to mount new categories' do
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice

    expect { click_button 'Speichern' }.to change {Category.count}.by(1)

    expect(page).to have_content category.name
    expect(page).to have_content category.notice
  end
  it 'allows to change categories' do
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice
    click_button 'Speichern'

    visit ("/categories/#{category.id}/edit")
    fill_in 'category_name', with: 'Lebensmittel123'
    uncheck('category_active')
    click_button 'Speichern'

    expect(page).to have_content 'Lebensmittel123'




  end
end