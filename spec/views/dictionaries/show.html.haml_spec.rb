require 'rails_helper'

RSpec.describe "dictionaries/show", :type => :view do
  before(:each) do
    @dictionary = assign(:dictionary, Dictionary.create!(
      :bigram => "Bigram",
      :count => 1,
      :weight => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bigram/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
