class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params[:post])
    redirect_to @post
  end
  
end
