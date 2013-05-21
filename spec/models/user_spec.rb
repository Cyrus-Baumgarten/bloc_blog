require 'spec_helper'

describe User do

  before do
    @user = User.new(
    name: "tester",
    email: "tester@test.com",
    password: "foobar",
    password_confirmation: "foobar",
    remember_me: true,
    anonymous: false,
    image_url: "www.image.com",
    subscribe: false)
  end

  it { should be_valid }

end