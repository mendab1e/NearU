require "rails_helper"

RSpec.describe TrashTweetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trash_tweets").to route_to("trash_tweets#index")
    end

    it "routes to #new" do
      expect(:get => "/trash_tweets/new").to route_to("trash_tweets#new")
    end

    it "routes to #show" do
      expect(:get => "/trash_tweets/1").to route_to("trash_tweets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trash_tweets/1/edit").to route_to("trash_tweets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trash_tweets").to route_to("trash_tweets#create")
    end

    it "routes to #update" do
      expect(:put => "/trash_tweets/1").to route_to("trash_tweets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trash_tweets/1").to route_to("trash_tweets#destroy", :id => "1")
    end

  end
end
