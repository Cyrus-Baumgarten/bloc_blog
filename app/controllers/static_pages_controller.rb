class StaticPagesController < ApplicationController
  def landing
  end

  def home
    @post = Post.first
  end

  def about
  end
end
