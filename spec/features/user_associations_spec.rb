require 'rails_helper'

describe User do
  it "should have many categories" do
    t = User.reflect_on_association(:categories)
    t.macro.should == :has_many
  end
  it "should have many baskets" do
    t = User.reflect_on_association(:baskets)
    t.macro.should == :has_many
  end
  it "should have many payments" do
    t = User.reflect_on_association(:payments)
    t.macro.should == :has_many
  end
  it "should have many items" do
    t = User.reflect_on_association(:items)
    t.macro.should == :has_many
  end
  it "should have many vendors" do
    t = User.reflect_on_association(:vendors)
    t.macro.should == :has_many
  end
end

