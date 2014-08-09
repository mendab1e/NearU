require 'rails_helper'

RSpec.describe "dictionaries/index", :type => :view do
  before(:each) do
    assign(:dictionaries, [
      Dictionary.create!(
        :bigram => "Bigram",
        :count => 1,
        :weight => 2
      ),
      Dictionary.create!(
        :bigram => "Bigram",
        :count => 1,
        :weight => 2
      )
    ])
  end

  it "renders a list of dictionaries" do
    render
    assert_select "tr>td", :text => "Bigram".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
