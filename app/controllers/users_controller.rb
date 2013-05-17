class UsersController < ApplicationController
  def index
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
  
end
