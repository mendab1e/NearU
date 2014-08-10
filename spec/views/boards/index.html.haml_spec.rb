require 'rails_helper'

RSpec.describe "boards/index", :type => :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :text => "Text",
        :full_text => "MyText",
        :url => "MyText",
        :lat => 1.5,
        :long => 1.5
      ),
      Board.create!(
        :text => "Text",
        :full_text => "MyText",
        :url => "MyText",
        :lat => 1.5,
        :long => 1.5
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
