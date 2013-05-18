class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id
  
  validates :content, presence: true, length: { maximum: 160 }
  
  belongs_to :user
  belongs_to :post
end
