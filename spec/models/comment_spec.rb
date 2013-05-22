require 'spec_helper'

describe Comment do

  describe "a blank comment should be invalid" do
    before do @comment = Comment.create(content:"") end
    subject { @comment }
    it { should be_invalid }
  end

end