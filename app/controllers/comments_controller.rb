# frozen_string_literal: true

class CommentsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_post
  before_action :authenticate_user!

  def create
    @comment = @post.post_comments.build(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was created.'
    else
      redirect_to post_path(@post), alert: 'Cannot create comment.'
    end
  end

  def destroy
    @comment = PostComment.find(params.expect(:id))
    if @comment.user == current_user
      @comment.destroy!

      redirect_to post_path(@post), notice: 'Comment was successfully deleted'
    else
      redirect_to post_path(@post), notice: 'You are not the creator of this comment'
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
