require 'rails_helper'

describe Item do
  it "should belong to user" do
    should belong_to(:user)
  end
  it "should belong to category" do
    should belong_to(:category)
  end
  it "should belong to basket" do
    should belong_to(:basket)
  end
end