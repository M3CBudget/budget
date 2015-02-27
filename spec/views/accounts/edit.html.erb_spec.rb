require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :number => "MyString",
      :bic => "MyString",
      :name => "MyString",
      :active => false,
      :user => nil
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_number[name=?]", "account[number]"

      assert_select "input#account_bic[name=?]", "account[bic]"

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_active[name=?]", "account[active]"

      assert_select "input#account_user_id[name=?]", "account[user_id]"
    end
  end
end
