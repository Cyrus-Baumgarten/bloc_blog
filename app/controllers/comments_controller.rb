class CommentsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_current_post
  
  def index
  end
  
  def create
    @comment = @post.comments.create(params[:comment])    
    @comment[:user_id] = @user.id
    @comment.save
    redirect_to :back
  end
end
