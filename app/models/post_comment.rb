# frozen_string_literal: true

# Model of comments to post
class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_ancestry

  validates :content, presence: true
end
