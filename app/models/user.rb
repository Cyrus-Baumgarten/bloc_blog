class User < ActiveRecord::Base
  attr_accessible :role, :anonymous, :email, :image_url, :name, :password, :password_confirm, :subscribe
    
  
  has_many :comments
end
