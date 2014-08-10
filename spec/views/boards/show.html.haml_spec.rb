require 'rails_helper'

RSpec.describe "boards/show", :type => :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :text => "Text",
      :full_text => "MyText",
      :url => "MyText",
      :lat => 1.5,
      :long => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
