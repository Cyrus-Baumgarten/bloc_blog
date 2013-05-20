class UsersController < ApplicationController
    
  def show
    @user = User.find_by_id(params[:id])
  end
  
  def edit
    @user = User.find_by_id(params[:id])
    unless current_user = @user
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
    end
  end
  
  def update
    @user = User.find_by_id(params[:id])
    unless current_user = @user
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
    else
      @user.update_attributes(params[:user])
      redirect_to @user
    end
  end
  
  def destroy
    unless current_user.admin?
      redirect_to :back
      flash[:authorized] = "You are not authorized to do that"
    else
      User.find_by_id(params[:id]).destroy
      redirect_to :back
    end
  end
end
