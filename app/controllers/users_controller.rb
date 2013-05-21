class UsersController < ApplicationController
    
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
