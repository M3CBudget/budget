require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :user => nil,
        :number => "Number",
        :bic => "Bic",
        :active => false,
        :name => "Name"
      ),
      Payment.create!(
        :user => nil,
        :number => "Number",
        :bic => "Bic",
        :active => false,
        :name => "Name"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Bic".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
