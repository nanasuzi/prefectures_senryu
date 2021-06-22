class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :destroy
end