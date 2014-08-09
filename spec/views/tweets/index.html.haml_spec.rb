require 'rails_helper'

RSpec.describe "tweets/index", :type => :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        :long => 1.5,
        :lat => 1.5,
        :user_screen_name => "User Screen Name",
        :text => "Text",
        :user_id => "User"
      ),
      Tweet.create!(
        :long => 1.5,
        :lat => 1.5,
        :user_screen_name => "User Screen Name",
        :text => "Text",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "User Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
