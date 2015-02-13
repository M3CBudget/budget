require 'rails_helper'

RSpec.describe "payments/index", :type => :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :name => "Name",
        :active => false,
        :account => nil
      ),
      Payment.create!(
        :name => "Name",
        :active => false,
        :account => nil
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
