class Public::HomesController < ApplicationController
  def top
    @post = Post.new
    @posts = Post.all
    @themes = Theme.all
  end

  def about
  end

end
