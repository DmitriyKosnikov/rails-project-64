# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit destroy update]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc).includes(:creator)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    return unless @post.creator != current_user

    redirect_to @post, notice: t('post.actions.not_creator')
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.creator = current_user if @post.new_record?

    if @post.save
      redirect_to @post, notice: t('post.actions.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.creator == current_user
      if @post.update(post_params)
        redirect_to @post, notice: t('post.actions.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to @post, notice: t('post.actions.not_creator')
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.creator == current_user
      @post.destroy!

      redirect_to root_path, status: :see_other, notice: t('post.actions.deleted')
    else
      redirect_to @post, notice: t('post.actions.not_creator')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.expect(post: %i[title body category_id user_id])
  end
end
