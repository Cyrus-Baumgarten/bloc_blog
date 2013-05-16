class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :comments, :title
  
  belongs_to :author
  has_many :comments
end
