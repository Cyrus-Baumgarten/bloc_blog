class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :comments, :title
  
  validates :body,    presence: true
  validates :title,   presence: true, uniqueness: true
  
  default_scope order('created_at desc')
  
  belongs_to :user
  has_many :comments
end
