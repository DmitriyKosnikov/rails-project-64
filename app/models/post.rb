# frozen_string_literal: true

# Model of Posts
class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  has_many :post_comments, dependent: :destroy

  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
