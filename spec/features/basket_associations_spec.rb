require 'rails_helper'

describe Basket do
  it "should have many items" do
    t = Basket.reflect_on_association(:items)
    t.macro.should == :has_many
  end
  it "should belong to user" do
    should belong_to(:user)
  end
  it "should belong to payment" do
    should belong_to(:payment)
  end
  it "should belong to vendor" do
    should belong_to(:vendor)
  end
end