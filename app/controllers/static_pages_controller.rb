class StaticPagesController < ApplicationController
  def landing
  end

  def home
    @post = Post.last
  end

  def about
  end
end
