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

require 'rails_helper'

RSpec.describe TrashTweet, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
