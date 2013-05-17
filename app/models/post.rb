class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :comments, :title
  
  validates :body, presence: true
  validates :title, presence: true, uniqueness: true
  
  belongs_to :author
  has_many :comments
end
