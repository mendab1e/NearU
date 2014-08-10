# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  text        :string(255)
#  full_text   :text
#  url         :text
#  payed_until :date
#  lat         :float
#  long        :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Board < ActiveRecord::Base
  validates_presence_of :long
  validates_presence_of :lat
  validates_length_of :text, :within => 1..255
end
