require 'rails_helper'

describe 'Sign up' do
  before(:each) do
    visit root_path
  end


  it 'allows to sign up' do
    click_link 'Sign up'
    fill_in 'user_first_name', with: 'Dieter'
    fill_in 'user_last_name', with: 'Müller'
    fill_in 'user_email', with: 'hallo@gmx.de'
    fill_in 'user_password', with: 'Spacken123'
    fill_in 'user_password_confirmation', with: 'Spacken123'

    expect { click_button 'Sign up' }.to change {User.count}.by(1)

    expect(page).to have_content 'hallo@gmx.de'
  end
end