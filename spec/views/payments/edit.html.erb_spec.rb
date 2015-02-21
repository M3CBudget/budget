require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :user => nil,
      :number => "MyString",
      :bic => "MyString",
      :active => false,
      :name => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input#payment_user_id[name=?]", "payment[user_id]"

      assert_select "input#payment_number[name=?]", "payment[number]"

      assert_select "input#payment_bic[name=?]", "payment[bic]"

      assert_select "input#payment_active[name=?]", "payment[active]"

      assert_select "input#payment_name[name=?]", "payment[name]"
    end
  end
end
