require 'rails_helper'

RSpec.describe "tweets/edit", :type => :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :long => 1.5,
      :lat => 1.5,
      :user_screen_name => "MyString",
      :text => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do

      assert_select "input#tweet_long[name=?]", "tweet[long]"

      assert_select "input#tweet_lat[name=?]", "tweet[lat]"

      assert_select "input#tweet_user_screen_name[name=?]", "tweet[user_screen_name]"

      assert_select "input#tweet_text[name=?]", "tweet[text]"

      assert_select "input#tweet_user_id[name=?]", "tweet[user_id]"
    end
  end
end
