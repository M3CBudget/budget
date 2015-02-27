require 'rails_helper'

describe 'Income' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:payment) { FactoryGirl.create(:payment) }
  let!(:item) { FactoryGirl.create(:item) }

  before(:each) do
    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Spacken123'
    click_button 'Sign in'
    item.user_id = user.id
    category.user_id = user.id
    vendor.user_id = user.id
    payment.user_id = user.id
    item.category_id = category.id
  end

  it 'allows to show vendor name' do
    ApplicationController.new.send(:show_vendor_name, vendor.id).should == vendor.name
  end
  it 'allows to show category name' do
    ApplicationController.new.send(:show_category_name, category.id).should == category.name
  end
  it 'allows to show payment name' do
    ApplicationController.new.send(:show_payment_name, payment.id).should == payment.name
  end
end