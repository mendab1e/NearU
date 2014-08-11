# == Schema Information
#
# Table name: trash_tweets
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

class TrashTweet < ActiveRecord::Base
  validates_length_of :text, :within => 1..140
  validates_presence_of :long
  validates_presence_of :lat
end
