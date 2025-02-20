# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.find_by(user: current_user)

    if @like.nil?
      @like = @post.likes.build(user: current_user)
      if @like.save
        redirect_to post_path(@post)
      else
        redirect_to post_path(@post), notice: t('like.error')
      end
    else
      redirect_to post_path(@post), notice: t('like.already_liked')
    end
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
