require 'rails_helper'

RSpec.describe "categories/edit", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :notice => "MyString",
      :active => false
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_notice[name=?]", "category[notice]"

      assert_select "input#category_active[name=?]", "category[active]"
    end
  end
end
