# frozen_string_literal: true

class AddLikesCountToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :likes_count, :integer, default: 0, null: false
  end
end
