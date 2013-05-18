class CommentsController < ApplicationController
  before_filter :set_current_user
  
  def index
  end
  
  def create
    @comment = Comment.create(params[:comment])
    redirect_to :back
  end
end
