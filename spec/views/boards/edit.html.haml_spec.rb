require 'rails_helper'

RSpec.describe "boards/edit", :type => :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :text => "MyString",
      :full_text => "MyText",
      :url => "MyText",
      :lat => 1.5,
      :long => 1.5
    ))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do

      assert_select "input#board_text[name=?]", "board[text]"

      assert_select "textarea#board_full_text[name=?]", "board[full_text]"

      assert_select "textarea#board_url[name=?]", "board[url]"

      assert_select "input#board_lat[name=?]", "board[lat]"

      assert_select "input#board_long[name=?]", "board[long]"
    end
  end
end
