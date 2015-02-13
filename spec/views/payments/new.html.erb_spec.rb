require 'rails_helper'

RSpec.describe "payments/new", :type => :view do
  before(:each) do
    assign(:payment, Payment.new(
      :name => "MyString",
      :active => false,
      :account => nil
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input#payment_name[name=?]", "payment[name]"

      assert_select "input#payment_active[name=?]", "payment[active]"

      assert_select "input#payment_account_id[name=?]", "payment[account_id]"
    end
  end
end
