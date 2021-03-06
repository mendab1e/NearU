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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    long 37.501953
    lat 55.80283
    user_screen_name "MarinkaBlondie"
    text "Вот такой уютный домик можно увидеть почти в центре Москвы! @ Поселок Художников http://t.co/M5kPqwKvh9"
    tweet_created_at "2014-08-10 14:12:19"
    user_id "212199186"
  end
end
