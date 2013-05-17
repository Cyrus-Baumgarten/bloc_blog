class User < ActiveRecord::Base
  attr_accessible :admin, :anonymous, :email, :image_url, :name, :password, :subscribe
  
  validates :title, presence: true, uniqueness: true
  
  
  
  has_many :comments
end
