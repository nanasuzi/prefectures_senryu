class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    @themes = Theme.all
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    dredirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :first_body, :middle_body, :last_body, :url, :theme_id, :user_id)
  end
end
