require 'rails_helper'

RSpec.describe "items/show", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :basket => nil,
      :category => nil,
      :article => nil,
      :user => nil,
      :name => "Name",
      :quantity => "9.99",
      :price => "9.99",
      :notice => "Notice",
      :income => false,
      :period => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Notice/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
