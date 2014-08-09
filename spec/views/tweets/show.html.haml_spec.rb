require 'rails_helper'

RSpec.describe "tweets/show", :type => :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :long => 1.5,
      :lat => 1.5,
      :user_screen_name => "User Screen Name",
      :text => "Text",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/User Screen Name/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/User/)
  end
end
