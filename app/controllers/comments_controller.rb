class CommentsController < ApplicationController
  def index
  end
  
  def create
    @comment = @post.comments.create(params[:comment])
    redirect_to :back
  end
end
