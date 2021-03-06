require 'spec_helper'

describe User do
  
  describe "New user without correct sign up should be invalid" do
    before do
      @user = User.new(
        email: "wrong@wrong",
        password: "short",
        password_confirmation: "mismatch")
      end
      subject { @user }
      it { should_not be_valid }
  end # New user without correct sign up should be invalid
  
  
  describe "User with email and password" do
    before do
      @user = User.create(
        email: "tester@test.com",
        password: "password",
        password_confirmation: "password",
        remember_me: true,
        anonymous: false,
        image_url: "www.image.com",
        subscribe: true )
      end
      
    #cont User with email and password...
    describe "...should be valid, and should respond to all attributes" do
      subject { @user }
      it { should be_valid }
      it { should respond_to(:email) }
      it { should respond_to(:encrypted_password) }
      it { should respond_to(:reset_password_token) }
      it { should respond_to(:reset_password_sent_at) }
      it { should respond_to(:remember_created_at) }
      it { should respond_to(:sign_in_count) }
      it { should respond_to(:current_sign_in_at) }
      it { should respond_to(:last_sign_in_at) }
      it { should respond_to(:name) }
      it { should respond_to(:anonymous) }
      it { should respond_to(:subscribe) }
      it { should respond_to(:image_url) }
      it { should respond_to(:created_at) }
      it { should respond_to(:updated_at) }
      it { should respond_to(:posts) }
      it { should respond_to(:comments) }
    end #...should be valid, and should respond to all attributes
    
    #cont User with email and password...
    describe "...should recieve an email when a post is made" do
      before do
        # Active ActionMailer for tests
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
        @mailer = User.create(
          email: "mailer@test.com",
          password: "password",
          password_confirmation: "password",
          remember_me: true,
          anonymous: false,
          image_url: "www.image.com",
          subscribe: true )
        @post = @user.posts.new(
        title:"rspec test post",
        body:"rspec test post")
        @post.save
      end
      subject { ActionMailer::Base.deliveries }
      its(:size) { should == 2 }
     end #...should recieve an email when a post is made
    
    #cont User with email and password...
    describe "...should be able to make posts" do
      before do
        @post = @user.posts.create(
        title:"rspec test post",
        body:"rspec test post")
      end
      subject { @post }
      it { should be_valid }
      its(:user) { should == @user }
    end #...should be able to make posts
    
    #cont User with email and password...
    describe "...should be able to comment on posts" do
      before do
        @post = @user.posts.create(
        title:"rspec test post",
        body:"rspec test post")
        @commenter = User.create(
        email: "tester2@test.com",
        password: "password",
        password_confirmation: "password")
        @comment = @post.comments.create(content: "rspec test comment")
        @comment.user = @commenter
        @comment.save
      end
      subject { @comment }
      it { should be_valid }
      
      #cont User with email and password...
      #cont...should be able to comment on posts
      describe "...comments should be related to posts and users" do
        subject { @comment }
        its(:user) { should == @commenter }
        its(:post) { should == @post }
      end #...comments should be related to posts and users
        
    end #...should be able to comment on posts
    
  end #User with email and password...

end #"User"
