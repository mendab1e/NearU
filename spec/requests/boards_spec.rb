require 'rails_helper'

RSpec.describe "Boards", :type => :request do
  describe "GET /boards" do
    it "works! (now write some real specs)" do
      get boards_path
      expect(response.status).to be(200)
    end
  end
end
