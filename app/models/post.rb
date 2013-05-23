class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :comments, :title
  after_save(:on => :create) do
    #sends email to subscribers
    User.all.each do |user|
      if user.subscribe?
        PostMailer.post_subscribe(user, self).deliver
      end
    end
  end
  
  
  validates :body,    presence: true
  validates :title,   presence: true, uniqueness: true
  
  default_scope order('created_at desc')
  
  belongs_to :user
  has_many :comments
  
end
