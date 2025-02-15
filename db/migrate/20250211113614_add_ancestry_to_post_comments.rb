# frozen_string_literal: true

class AddAncestryToPostComments < ActiveRecord::Migration[8.0] # rubocop:disable Style/Documentation
  def change
    add_column :post_comments, :ancestry, :string
    add_index :post_comments, :ancestry
  end
end
