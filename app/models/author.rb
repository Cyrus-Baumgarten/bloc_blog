class Author < ActiveRecord::Base
  attr_accessible :admin, :email, :facebook, :github, :linkedin, :name, :password, :twitter, :website
    
  has_many :posts
  has_many :comments
end
