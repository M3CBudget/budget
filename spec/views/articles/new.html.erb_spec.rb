require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :name => "MyString",
      :standard_price => "9.99",
      :active_boolean => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_standard_price[name=?]", "article[standard_price]"

      assert_select "input#article_active_boolean[name=?]", "article[active_boolean]"
    end
  end
end
