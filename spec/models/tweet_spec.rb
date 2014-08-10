# == Schema Information
#
# Table name: tweets
#
#  id               :integer          not null, primary key
#  long             :float
#  lat              :float
#  user_screen_name :string(255)
#  text             :string(255)
#  tweet_created_at :datetime
#  user_id          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe Tweet, :type => :model do
  it "creates a new instance" do
    tweet = create(:tweet)
    expect(tweet).to be_valid
  end

  it "rejects a new instance if tweet longer than 140 or smaller than 1" do
    tweet = build(:tweet, text: 'a' * 141)
    expect(tweet).not_to be_valid
    tweet = build(:tweet, text: '')
    expect(tweet).not_to be_valid
  end

  it "reject a new instance without lat or long" do
    tweet = build(:tweet, long: nil)
    expect(tweet).not_to be_valid
    tweet = build(:tweet, lat: nil)
    expect(tweet).not_to be_valid
  end
end
