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

require 'rails_helper'

RSpec.describe Board, :type => :model do
  it "creates a new instance" do
    board = create(:board)
    expect(board).to be_valid
  end

  it "rejects without lat or long" do
    board = build(:board, lat: nil)
    expect(board).not_to be_valid
    board = build(:board, long: nil)
    expect(board).not_to be_valid
  end

  it "rejects with text greater than 255 symbols or smaller than 1" do
    board = build(:board, text: '')
    expect(board).not_to be_valid
    board = build(:board, text: 'a' * 256)
    expect(board).not_to be_valid
  end
end
