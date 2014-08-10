require 'rails_helper'

RSpec.describe "boards/new", :type => :view do
  before(:each) do
    assign(:board, Board.new(
      :text => "MyString",
      :full_text => "MyText",
      :url => "MyText",
      :lat => 1.5,
      :long => 1.5
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input#board_text[name=?]", "board[text]"

      assert_select "textarea#board_full_text[name=?]", "board[full_text]"

      assert_select "textarea#board_url[name=?]", "board[url]"

      assert_select "input#board_lat[name=?]", "board[lat]"

      assert_select "input#board_long[name=?]", "board[long]"
    end
  end
end
