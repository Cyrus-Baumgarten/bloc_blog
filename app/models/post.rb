class Post < ActiveRecord::Base
  attr_accessible :author_id, :content, :name, :title
  belongs_to :author
end
