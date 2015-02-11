require 'rails_helper'

RSpec.describe "baskets/edit", :type => :view do
  before(:each) do
    @basket = assign(:basket, Basket.create!(
      :notice => "MyString",
      :amount => "9.99",
      :document => ""
    ))
  end

  it "renders the edit basket form" do
    render

    assert_select "form[action=?][method=?]", basket_path(@basket), "post" do

      assert_select "input#basket_notice[name=?]", "basket[notice]"

      assert_select "input#basket_amount[name=?]", "basket[amount]"

      assert_select "input#basket_document[name=?]", "basket[document]"
    end
  end
end
