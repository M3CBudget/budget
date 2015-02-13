require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :number => "Number",
      :bic => "Bic",
      :name => "Name",
      :active => false,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Bic/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
