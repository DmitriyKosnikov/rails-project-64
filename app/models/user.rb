# frozen_string_literal: true

# User with auth
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy, inverse_of: :creator
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
end
