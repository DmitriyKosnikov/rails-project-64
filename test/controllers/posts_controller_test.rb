# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: {
      post: {
        body: @post.body,
        category_id: @post.category_id,
        title: @post.title,
        creator: @post.creator
      }
    }

    assert_response :redirect

    created_post =
      Post.find_by(
        body: @post.body,
        category_id: @post.category_id,
        title: @post.title,
        creator: @post.creator
      )

    assert(created_post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: {
      post: {
        body: @post.body,
        category_id: @post.category_id,
        title: @post.title,
        creator: @post.creator
      }
    }
    assert_response :redirect

    updated_post = Post.find_by(
      body: @post.body,
      category_id: @post.category_id,
      title: @post.title,
      creator: @post.creator
    )

    assert(updated_post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to root_url
  end
end
