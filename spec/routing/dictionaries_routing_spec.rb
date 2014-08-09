require "rails_helper"

RSpec.describe DictionariesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dictionaries").to route_to("dictionaries#index")
    end

    it "routes to #new" do
      expect(:get => "/dictionaries/new").to route_to("dictionaries#new")
    end

    it "routes to #show" do
      expect(:get => "/dictionaries/1").to route_to("dictionaries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dictionaries/1/edit").to route_to("dictionaries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dictionaries").to route_to("dictionaries#create")
    end

    it "routes to #update" do
      expect(:put => "/dictionaries/1").to route_to("dictionaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dictionaries/1").to route_to("dictionaries#destroy", :id => "1")
    end

  end
end
