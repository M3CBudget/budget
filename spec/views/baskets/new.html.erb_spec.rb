require 'rails_helper'

RSpec.describe "baskets/new", :type => :view do
  before(:each) do
    assign(:basket, Basket.new(
      :notice => "MyString",
      :amount => "9.99",
      :document => "",
      :user => nil,
      :payment => nil,
      :vendor => nil
    ))
  end

  it "renders new basket form" do
    render

    assert_select "form[action=?][method=?]", baskets_path, "post" do

      assert_select "input#basket_notice[name=?]", "basket[notice]"

      assert_select "input#basket_amount[name=?]", "basket[amount]"

      assert_select "input#basket_document[name=?]", "basket[document]"

      assert_select "input#basket_user_id[name=?]", "basket[user_id]"

      assert_select "input#basket_payment_id[name=?]", "basket[payment_id]"

      assert_select "input#basket_vendor_id[name=?]", "basket[vendor_id]"
    end
  end
end
