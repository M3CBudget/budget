require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :name => "Name",
        :standard_price => "9.99",
        :active_boolean => "Active Boolean"
      ),
      Article.create!(
        :name => "Name",
        :standard_price => "9.99",
        :active_boolean => "Active Boolean"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Active Boolean".to_s, :count => 2
  end
end
