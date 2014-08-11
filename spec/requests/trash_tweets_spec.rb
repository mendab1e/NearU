require 'rails_helper'

RSpec.describe "TrashTweets", :type => :request do
  describe "GET /trash_tweets" do
    it "works! (now write some real specs)" do
      get trash_tweets_path
      expect(response.status).to be(200)
    end
  end
end
