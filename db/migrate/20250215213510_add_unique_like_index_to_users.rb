# frozen_string_literal: true

class AddUniqueLikeIndexToUsers < ActiveRecord::Migration[8.0]
  def change
    add_index :post_likes, %i[user_id post_id], unique: true
  end
end
