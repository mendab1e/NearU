class Dictionary < ActiveRecord::Base
  validates_presence_of :bigram
end
