require 'rails_helper'

RSpec.describe "dictionaries/edit", :type => :view do
  before(:each) do
    @dictionary = assign(:dictionary, Dictionary.create!(
      :bigram => "MyString",
      :count => 1,
      :weight => 1
    ))
  end

  it "renders the edit dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionary_path(@dictionary), "post" do

      assert_select "input#dictionary_bigram[name=?]", "dictionary[bigram]"

      assert_select "input#dictionary_count[name=?]", "dictionary[count]"

      assert_select "input#dictionary_weight[name=?]", "dictionary[weight]"
    end
  end
end
