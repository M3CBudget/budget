require 'rails_helper'

describe Category do
  it "should belong to an user" do
    should belong_to(:user)
  end
  it "should belong to a glyiphicon" do
    should belong_to(:glyphicon)
  end
end