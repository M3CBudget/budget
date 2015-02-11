require 'rails_helper'

RSpec.describe "baskets/index", :type => :view do
  before(:each) do
    assign(:baskets, [
      Basket.create!(
        :notice => "Notice",
        :amount => "9.99",
        :document => ""
      ),
      Basket.create!(
        :notice => "Notice",
        :amount => "9.99",
        :document => ""
      )
    ])
  end

  it "renders a list of baskets" do
    render
    assert_select "tr>td", :text => "Notice".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
