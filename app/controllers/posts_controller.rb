class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    @comments = Comment.last
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params[:post])
    x = @post.id
    y = Post.find_by_id(x)
    redirect_to y
  end
  
end
