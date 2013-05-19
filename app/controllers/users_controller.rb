class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    flash[:welcome] = "Welcome new user"
    redirect_to @user
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
  
  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    redirect_to @user
  end
  
  def destroy
    User.find_by_id(params[:id]).destroy
    redirect_to users_path
  end
  
end
