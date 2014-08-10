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

class Dictionary < ActiveRecord::Base
  validates_presence_of :bigram
  validates_numericality_of :count, greater_than: 0
end
