require 'rails_helper'

RSpec.describe "trash_tweets/index", :type => :view do
  before(:each) do
    assign(:trash_tweets, [
      TrashTweet.create!(
        :long => 1.5,
        :lat => 1.5,
        :user_screen_name => "User Screen Name",
        :text => "Text",
        :user_id => "User"
      ),
      TrashTweet.create!(
        :long => 1.5,
        :lat => 1.5,
        :user_screen_name => "User Screen Name",
        :text => "Text",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of trash_tweets" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "User Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
