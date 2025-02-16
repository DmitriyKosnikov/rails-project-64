# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.comments.build(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: t('comment.actions.created')
    else
      redirect_to post_path(@post), alert: t('comment.actions.cant_create')
    end
  end

  def destroy
    @comment = PostComment.find(params.expect(:id))
    if @comment.user == current_user
      @comment.destroy!

      redirect_to post_path(@post), notice: t('comment.actions.deleted')
    else
      redirect_to post_path(@post), notice: t('comment.actions.not_creator')
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.expect(post_comment: %i[content parent_id])
  end
end
