# frozen_string_literal: true

class CreatePostLikes < ActiveRecord::Migration[8.0] # rubocop:disable Style/Documentation
  def change
    create_table :post_likes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
