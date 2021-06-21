class Admin::ThemesController < AdminsController
  def index
    @theme = Theme.new
    @themes = Theme.all
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.save
    redirect_to admin_themes_path
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    theme = Theme.find(params[:id])
    theme.update(theme_params)
    redirect_to admin_themes_path
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
