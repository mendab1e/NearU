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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trash_tweet do
    long 1.5
    lat 1.5
    user_screen_name "MyString"
    text "MyString"
    tweet_created_at "2014-08-11 23:32:56"
    user_id "MyString"
  end
end
