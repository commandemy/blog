require 'spec_helper'

describe Article do

  before(:each) do
    @text = "This is a longer article text. This way, we make sure that we get a different number."
    @article = Article.create(title: "This is my article", text: @text)
  end

  it "returns the number of characters used in the text" do
    expect(@article.number_of_characters).to eq(@text.length)
  end

end
