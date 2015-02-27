require 'rails_helper'
#nicht fertig. erst Basket view vollständig fertigen
describe 'Payment' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:payment) { FactoryGirl.create(:payment) }
  before(:each) do
    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'Spacken123'
    click_button 'Sign in'

    visit ('/vendors/new')
    fill_in 'vendor_name', with: vendor.name
    expect { click_button 'Neu Anlegen' }.to change {Vendor.count}.by(1)
    visit ('/categories/new')
    expect(page).to have_content 'Kategorie'
    uncheck('category_income')
    check('category_active')
    fill_in 'category_name', with: category.name
    fill_in 'category_notice', with: category.notice
    expect { click_button 'Speichern' }.to change {Category.count}.by(1)
    visit ('/payments/new')
    expect(page).to have_content 'Zahlungsmethode'
    check('payment_active')
    fill_in 'payment_name', with: payment.name
    fill_in 'payment_number', with: payment.number
    fill_in 'payment_bic', with: payment.bic
    expect { click_button 'Speichern' }.to change {Payment.count}.by(1)

    visit ('/baskets/new')
    expect(page).to have_content 'Ausgabe'
  end


  it 'allows to mount new baskets' do
    #fill_in 'basket_notice', with: 'Hallo'
    #fill_in 'basket_amount', with: 2.69
    #fill_in 'basket_user_id', with: 1
    #fill_in 'basket_payment_id', with: 1
    #fill_in 'basket_items_attributes_0_name', with: 'Milch'
    #fill_in 'basket_items_attributes_0_price', with: 0.59
    #fill_in 'basket_items_attributes_0_quantity', with: 2

    #expect { click_button 'Create Basket' }.to change {Basket.count}.by(1)

    #expect(page).to have_content 'Hallo'
  end
end