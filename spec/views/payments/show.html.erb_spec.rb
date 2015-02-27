require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :user => nil,
      :number => "Number",
      :bic => "Bic",
      :active => false,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Bic/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Name/)
  end
end
