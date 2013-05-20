class PostsController < ApplicationController
  
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    session[:post] = params[:id]
    @comments = @post.comments.all
    @comment = @post.comments.create
  end
  
  def new
    @post = current_user.posts.create
  end
  
  def create
    @post = current_user.posts.create(params[:post])
    redirect_to @post
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])
    redirect_to @post
  end
  
  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to posts_path
  end
  
end
