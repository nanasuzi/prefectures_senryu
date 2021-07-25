class Admin::PostsController < AdminsController
  def search
    @post = Post.new
    @themes = Theme.all
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
