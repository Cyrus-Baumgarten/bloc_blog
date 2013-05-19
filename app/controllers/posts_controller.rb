class PostsController < ApplicationController
  
  before_filter :set_current_user
  before_filter :set_current_post
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    session[:post] = params[:id]
    @comments = @post.comments
    @comment = @post.comments.create
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(params[:post])
    redirect_to @post
  end
  
end
