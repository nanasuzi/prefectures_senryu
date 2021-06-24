class Public::UsersController < ApplicationController
  before_action :ensure_user, only:[:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def unsubscribe
  end

  def withdrawl
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :is_active)
  end

  def ensure_user
    @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user)
      end
  end

end