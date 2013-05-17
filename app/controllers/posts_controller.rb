class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params[:post])
    @post.save
    redirect_to root_path
  end
  
end
