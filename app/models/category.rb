# frozen_string_literal: true

# The Category of Post
class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 2..50 }

  has_many :posts, dependent: :destroy
end
