require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :basket => nil,
        :category => nil,
        :article => nil,
        :user => nil,
        :name => "Name",
        :quantity => "9.99",
        :price => "9.99",
        :notice => "Notice",
        :income => false,
        :period => 1
      ),
      Item.create!(
        :basket => nil,
        :category => nil,
        :article => nil,
        :user => nil,
        :name => "Name",
        :quantity => "9.99",
        :price => "9.99",
        :notice => "Notice",
        :income => false,
        :period => 1
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Notice".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
