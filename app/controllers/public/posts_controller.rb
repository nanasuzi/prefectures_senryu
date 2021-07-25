class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def search
    @post = Post.new
    @themes = Theme.all
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render 'public/homes/top'
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿完了"
      redirect_to root_path
    else
      @posts = Post.all
      @themes = Theme.all
      render "public/homes/top"
    end
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
    if post.update(post_params)
      flash[:notice] = "更新完了"
      redirect_to post_path(post)
    else
      render :edit
    end
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
