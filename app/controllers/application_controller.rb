class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def set_current_post
    unless session[:post].nil?
      @post = Post.find(session[:post])    
    end
  end
  
  def after_sign_in_path_for(users)
   user_path(current_user)
  end
  
  def after_sign_out_path_for(users)
    root_path
  end
  
end
