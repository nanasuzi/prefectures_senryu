class Public::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = "ユーザをフォローしました"
      @user.create_notification_follow!(current_user)
      redirect_to @user
    else
      flash.now[:alert] = "ユーザのフォローに失敗しました"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = "ユーザのフォローを解除しました"
      redirect_to @user
    else
      flash.now[:alert] = "ユーザのフォロー解除に失敗しました"
      redirect_to @user
    end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
