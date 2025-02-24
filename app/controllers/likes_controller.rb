# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.find_or_create_by(user: current_user)

    redirect_to @post
  end

  def destroy
    @like = @post.likes.find(params[:id])

    @like.destroy if @like.user == current_user
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
