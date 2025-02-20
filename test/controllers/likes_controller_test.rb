# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:one)
    @like = post_likes(:one)
  end

  test 'should create like' do
    post post_likes_path(@post)

    assert_equal 1, @post.likes.count

    assert_redirected_to @post
  end

  test 'should destroy like' do
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post, @like)
    end
  end
end
