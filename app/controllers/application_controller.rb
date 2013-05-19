class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def set_current_user
    unless session[:current_user_id].nil?
      @user = User.find(session[:current_user_id])
      flash[:instance] = "YOU ARE CURRENTLY INTANTISED AS: #{@user.name}"
    end
  end
  
  def set_current_post
    unless session[:post].nil?
      @post = Post.find(session[:post])    
    end
  end
  
end
