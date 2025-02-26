# frozen_string_literal: true

# count of Likes in post
class PostLike < ApplicationRecord
  belongs_to :post, counter_cache: :likes_count
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_id }
end
