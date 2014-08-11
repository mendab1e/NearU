require 'rails_helper'

RSpec.describe "trash_tweets/edit", :type => :view do
  before(:each) do
    @trash_tweet = assign(:trash_tweet, TrashTweet.create!(
      :long => 1.5,
      :lat => 1.5,
      :user_screen_name => "MyString",
      :text => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit trash_tweet form" do
    render

    assert_select "form[action=?][method=?]", trash_tweet_path(@trash_tweet), "post" do

      assert_select "input#trash_tweet_long[name=?]", "trash_tweet[long]"

      assert_select "input#trash_tweet_lat[name=?]", "trash_tweet[lat]"

      assert_select "input#trash_tweet_user_screen_name[name=?]", "trash_tweet[user_screen_name]"

      assert_select "input#trash_tweet_text[name=?]", "trash_tweet[text]"

      assert_select "input#trash_tweet_user_id[name=?]", "trash_tweet[user_id]"
    end
  end
end
