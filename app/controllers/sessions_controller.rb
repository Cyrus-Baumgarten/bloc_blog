class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by_name(params[:session][:name])
      session[:current_user_id] = user.id
      flash[:signed_in] = "YOU ARE NOW SIGNED IN AS USER NUMBER #{session[:current_user_id]}"
      redirect_to root_path
    else
      flash[:error] = "THAT IS NOT A VALID USER"
      redirect_to root_path
    end
      
  end

  def destroy
  end
end
