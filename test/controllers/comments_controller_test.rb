# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test 'should create post_comment' do
    assert_difference 'PostComment.count', 1 do
      post post_comments_url(@post), params: {
        post_comment: {
          content: @comment.content,
          parent_id: @comment.parent_id
        }
      }
    end

    assert_redirected_to post_path(@post)

    created_comment = PostComment.find(@comment.id)

    assert(created_comment.post, @post.id)
  end

  test 'should destroy post_comment' do
    assert_difference('PostComment.count', -1) do
      delete post_comment_url(@post, @comment)
    end
  end
end
