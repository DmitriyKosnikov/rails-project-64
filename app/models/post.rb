# frozen_string_literal: true

# Model of Posts
class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts

  validates :title, presence: true, length: { in: 5..255 }
  validates :body, presence: true, length: { in: 200..4000 }
  # validates :title, length: { in: 5..255 }
  # validates :body, length: { in: 200..4000 }
end
