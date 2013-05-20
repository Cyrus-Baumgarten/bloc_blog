class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def set_current_post
    unless session[:post].nil?
      @post = Post.find(session[:post])    
    end
  end
  
end
