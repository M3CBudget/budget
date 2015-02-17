require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :basket => nil,
      :category => nil,
      :article => nil,
      :user => nil,
      :name => "MyString",
      :quantity => "9.99",
      :price => "9.99",
      :notice => "MyString",
      :income => false,
      :period => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_basket_id[name=?]", "item[basket_id]"

      assert_select "input#item_category_id[name=?]", "item[category_id]"

      assert_select "input#item_article_id[name=?]", "item[article_id]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "input#item_quantity[name=?]", "item[quantity]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_notice[name=?]", "item[notice]"

      assert_select "input#item_income[name=?]", "item[income]"

      assert_select "input#item_period[name=?]", "item[period]"
    end
  end
end
