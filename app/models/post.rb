# frozen_string_literal: true

# Model of Posts
class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
end
