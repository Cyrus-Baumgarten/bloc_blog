class UsersController < ApplicationController
  
  def toggle
    if current_user.anonymous?
      current_user.update_attributes(anonymous: false)
      flash[:success] = "Your comments are now credited to your username"
      redirect_to :back
    elsif current_user.name.empty?
      current_user.update_attributes(anonymous: false)
      flash[:error] = "You need a user name if you want your comments to be credited"
      redirect_to edit_user_path(current_user)
    else
      current_user.update_attributes(anonymous: true)
      flash[:success] = "Your comments and profile are now anonymous"
      redirect_to :back
    end
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    unless current_user = @user
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless current_user = @user
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path
    else
      @user.update_attributes(params[:user])
      redirect_to @user
    end
  end
  
  def destroy
    unless current_user.admin?
      flash[:error] = "You are not authorized to do that"      
      redirect_to root_path
    else
      User.find(params[:id]).destroy
      redirect_to root_path
    end
  end
end
