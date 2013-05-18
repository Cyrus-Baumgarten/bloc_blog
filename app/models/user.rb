class User < ActiveRecord::Base
  attr_accessible :role, :anonymous, :email, :image_url, :name, :password, :password_confirm, :subscribe
    
  validates :name,              presence: true, uniqueness: true
  validates :password,          presence: true
  validates :email,             presence: true, uniqueness: true
  
  
  
  has_many :comments
end
