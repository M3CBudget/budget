require 'rails_helper'

RSpec.describe "payments/show", :type => :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :name => "Name",
      :active => false,
      :account => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
