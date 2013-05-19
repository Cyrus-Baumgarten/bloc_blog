class CommentsController < ApplicationController
  before_filter :set_current_user
  before_filter :set_current_post
  
  def index
  end
  
  def create
    @comment = @post.comments.create(params[:comment])    
    @comment.user = @user
    @comment.save
    redirect_to :back
  end
  
  def edit
    @comment = Comment.find_by_id(params[:id])
  end
  
  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to @post
  end
  
  def destroy
    Comment.find_by_id(params[:id]).destroy
    redirect_to :back
  end
end
