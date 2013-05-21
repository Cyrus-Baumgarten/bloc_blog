class CommentsController < ApplicationController
  before_filter :set_current_post
  before_filter :authenticate_user!, only: [:create]
  
  
  def index
  end
  
  def create
    @comment = @post.comments.create(params[:comment])    
    @comment.user = current_user
    @comment.save
    redirect_to :back
  end
  
  def edit
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
      return
    end
  end
  
  def update
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
    else
      @comment.update_attributes(params[:comment])
      redirect_to @post
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user or current_user.admin?
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
    else
      @comment.destroy
      redirect_to :back
    end
  end
end
