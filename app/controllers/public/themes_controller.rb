class Public::ThemesController < ApplicationController
  def index
    @themes = Theme.all
  end

  def show
    @theme = Theme.find(params[:id])
    @posts = @theme.posts
  end
end
