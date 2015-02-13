require 'rails_helper'

RSpec.describe "baskets/show", :type => :view do
  before(:each) do
    @basket = assign(:basket, Basket.create!(
      :notice => "Notice",
      :amount => "9.99",
      :document => "",
      :user => nil,
      :payment => nil,
      :vendor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Notice/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
