# frozen_string_literal: true

class LikesController < ApplicationController # rubocop:disable Style/Documentation
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.post_likes.build(user: current_user)

    if @like.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: 'Something went wrong'
    end
  end

  def destroy
    @like = @post.post_likes.find(params[:id])

    @like.destroy if @like.user == current_user
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
