class Comment < ActiveRecord::Base
  attr_accessible :author_id, :content, :post_id, :user_id
  
  belongs_to :author
  belongs_to :user
  belongs_to :post
end
