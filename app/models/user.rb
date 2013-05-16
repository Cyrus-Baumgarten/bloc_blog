class User < ActiveRecord::Base
  attr_accessible :admin, :anonymous, :email, :image_url, :name, :password, :subscribe
  
  has_many :comments
end
