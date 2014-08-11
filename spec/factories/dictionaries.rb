# == Schema Information
#
# Table name: dictionaries
#
#  id         :integer          not null, primary key
#  bigram     :string(255)
#  count      :integer          default(0)
#  weight     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dictionary do
    bigram "zero the"
    count 1
    weight 0
  end
end
