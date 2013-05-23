class StaticPagesController < ApplicationController
  def landing
  end

  def home
    @post = Post.first unless Post.empty?
  end

  def about
  end
end
