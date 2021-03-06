class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  
  
  def index
  end
  
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(params[:comment])    
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment submitted"
      redirect_to @post
    else
      flash[:error] = "Comment is invalid"
      redirect_to @post
    end
  end
  
  def edit
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user or current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path      
    end
  end
  
  def update
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user or current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path     
    else
      if @comment.update_attributes(params[:comment])
        flash[:success] = "Comment Updated"
        redirect_to @comment.post
      else
        flash.now[:error] = "Edit failed"
        render 'edit'
      end
    end
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    unless current_user == @comment.user or current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path     
    else
      @post = @comment.post
      @comment.destroy
      redirect_to @post
    end
  end
end
