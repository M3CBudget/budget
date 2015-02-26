require 'rails_helper'

describe Glyphicon do
  it "should have many categories" do
    t = User.reflect_on_association(:categories)
    t.macro.should == :has_many
  end
end
