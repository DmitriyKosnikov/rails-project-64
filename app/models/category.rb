# frozen_string_literal: true

# The Category of Post
class Category < ApplicationRecord
  validates :name, presence: true

  has_many :posts
end
