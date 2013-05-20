class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_id(params[:id])
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
