require 'rails_helper'

RSpec.describe "articles/edit", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "MyString",
      :price => "9.99",
      :active => false,
      :category => nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_price[name=?]", "article[price]"

      assert_select "input#article_active[name=?]", "article[active]"

      assert_select "input#article_category_id[name=?]", "article[category_id]"
    end
  end
end
