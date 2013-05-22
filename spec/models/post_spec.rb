require 'spec_helper'

describe Post do

  describe "a blank post should be invalid" do
    before do @post = Post.create(title:"", body:"") end
    subject { @post }
    it { should be_invalid }
  end

end