require 'spec_helper'

describe Post do

  before(:each) do
    @text = "This is a longer post text. This way, we make sure that we get a different number."
    @post = Post.create(title: "This is my post", text: @text)
  end

  it "returns the number of characters used in the text" do
    expect(@post.number_of_characters).to eq(@text.length)
  end

end
