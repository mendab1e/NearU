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

class Tweet < ActiveRecord::Base
  validates_length_of :text, :within => 1..140
  validates_presence_of :long
  validates_presence_of :lat

  scope :for_map, -> (long1, lat1, long2, lat2) {
    where('long >= ? and long <= ? and lat >= ? and lat <= ?', long1, long2, lat1, lat2)
    .order('tweet_created_at DESC') }
end
