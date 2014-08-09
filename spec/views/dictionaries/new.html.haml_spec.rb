require 'rails_helper'

RSpec.describe "dictionaries/new", :type => :view do
  before(:each) do
    assign(:dictionary, Dictionary.new(
      :bigram => "MyString",
      :count => 1,
      :weight => 1
    ))
  end

  it "renders new dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionaries_path, "post" do

      assert_select "input#dictionary_bigram[name=?]", "dictionary[bigram]"

      assert_select "input#dictionary_count[name=?]", "dictionary[count]"

      assert_select "input#dictionary_weight[name=?]", "dictionary[weight]"
    end
  end
end
