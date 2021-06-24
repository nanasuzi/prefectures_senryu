class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :first_body, presence: true, length: { is:5 }
  validates :middle_body, presence: true, length: { is:7 }
  validates :last_body, presence: true, length: { is:5 }

  def favorited_by?(current_user)
    favorites.where(user_id: user.id).exists?
  end
end
