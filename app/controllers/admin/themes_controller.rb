class Admin::ThemesController < AdminsController
  def index
    @theme = Theme.new
    @themes = Theme.all
  end

  def create
    @theme = Theme.new(theme_params)
    @themes = Theme.all
    if @theme.save
      flash[:notice] = "作成完了"
      redirect_to admin_themes_path
    else
      render :index
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @posts = @theme.posts
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      flash[:notice] = "更新完了"
      redirect_to admin_themes_path
    else
      render :edit
    end
  end

  def destroy
    theme = Theme.find(params[:id])
    theme.destroy
    redirect_to admin_themes_path
  end

  private

  def theme_params
    params.require(:theme).permit(:name)
  end
end
