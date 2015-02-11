require 'rails_helper'

RSpec.describe "articles/edit", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "MyString",
      :standard_price => "9.99",
      :active_boolean => "MyString"
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_standard_price[name=?]", "article[standard_price]"

      assert_select "input#article_active_boolean[name=?]", "article[active_boolean]"
    end
  end
end
