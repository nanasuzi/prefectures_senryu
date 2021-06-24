class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(current_user)
    favorites.where(user_id: user.id).exists?
  end
end
