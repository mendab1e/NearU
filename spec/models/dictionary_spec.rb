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

require 'rails_helper'

RSpec.describe Dictionary, :type => :model do
  it "creates a new instance" do
    dictionary = create(:dictionary)
    expect(dictionary).to be_valid
  end

  it "rejects a new instance without bigram" do
    dictionary = build(:dictionary, bigram: '')
    expect(dictionary).not_to be_valid
  end

  it "rejects a new instance with non-positive count" do
    dictionary = build(:dictionary, count: 0)
    expect(dictionary).not_to be_valid
  end
end
