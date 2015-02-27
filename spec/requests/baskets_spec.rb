require 'rails_helper'

RSpec.describe "Baskets", :type => :request do
  describe "GET /baskets" do
    it "works! (now write some real specs)" do
      get baskets_path
      expect(response).to have_http_status(200)
    end
  end
end
