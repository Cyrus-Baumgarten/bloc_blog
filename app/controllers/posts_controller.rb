class PostsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :delete]

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    session[:post] = params[:id]
    @comments = @post.comments.all
    @comment = @post.comments.build
  end
  
  def new
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path
    else
      @post = current_user.posts.build
    end
  end
  
  def create
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path      
    else
      @post = current_user.posts.build(params[:post])
      if @post.save
        flash[:success] = "Post Created"
        redirect_to @post
      else
        flash.now[:error] = "Post is invalid"
        render 'new'
      end
    end
  end
  
  def edit
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path      
    else
      @post = Post.find_by_id(params[:id])
    end
  end
  
  def update
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path      
    else
      @post = Post.find_by_id(params[:id])
      if @post.update_attributes(params[:post])
        flash[:success] = "Post updated"
        redirect_to @post
      else
        flash.now[:error] = "Post is invalid"
        render 'edit'
      end
    end
  end
  
  def destroy
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path      
    else
      Post.find_by_id(params[:id]).destroy
      redirect_to posts_path
    end
  end
end
