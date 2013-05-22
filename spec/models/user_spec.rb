require 'spec_helper'

describe User do
  

  before do
    @user = User.new(
      name: "tester",
      email: "tester@test.com",
      password: "password",
      password_confirmation: "password",
      remember_me: true,
      anonymous: false,
      image_url: "www.image.com",
      subscribe: false )
  end
  
  subject { @user }

  it { should be_valid }
  it { should respond_to(:admin) }
  it { should respond_to(:email) }
  
  
  

end