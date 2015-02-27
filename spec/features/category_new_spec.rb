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
  end


  it 'allows to mount new income categories' do
    check('category_income')
    check('category_active')
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice

    expect { click_button 'Speichern' }.to change {Category.count}.by(1)
    expect(page).to have_css('.fa-plus')
    expect(page).to_not have_css('.fa-minus')
    expect(page).to have_content category.name
    expect(page).to have_content category.notice
  end
  it 'allows to mount new basket categories' do
    uncheck('category_income')
    check('category_active')
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice

    expect { click_button 'Speichern' }.to change {Category.count}.by(1)
    #expect(page).to_not have_css('.fa-plus')
    expect(page).to have_css('.fa-minus')
    expect(page).to have_content category.name
    expect(page).to have_content category.notice
  end
end