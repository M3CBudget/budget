require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :name => "MyString",
      :price => "9.99",
      :active => false,
      :category => nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_price[name=?]", "article[price]"

      assert_select "input#article_active[name=?]", "article[active]"

      assert_select "input#article_category_id[name=?]", "article[category_id]"
    end
  end
end
