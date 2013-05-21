class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def after_sign_in_path_for(users)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(users)
    root_path
  end
  
end
