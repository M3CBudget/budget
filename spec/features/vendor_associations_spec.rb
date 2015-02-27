require 'rails_helper'

describe Payment do

  it "should belong to an user" do
    should belong_to(:user)
  end
  it "should have many baskets" do
    t = User.reflect_on_association(:baskets)
    t.macro.should == :has_many
  end
end