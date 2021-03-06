class PostsController < ApplicationController
  include SessionsHelper
  include PostsHelper

  def index
    @posts = Post.where(user_id: params[:post_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @post = Post.create(post_params)
    counter = WordsCounted.count(@post.content, {exclude: ->(t) {t.length < 3}})
    @post.words_counted = counter.token_count
    counter.token_frequency
    @post.words_freq = wordCount_formatter(counter.token_frequency).to_json
    @post.save
    redirect_to user_path(@post.user_id)
  end

  def show
    @post = Post.find_by_id(post_id)
  end

  def edit
    @post = Post.find_by_id(post_id)
  end

  def update
    @post = Post.find_by_id(post_id)
    @post.update_attributes(post_params)
    redirect_to user_path(@post.user_id)
  end

  def destroy
    @post = Post.find_by_id(post_id)
    @post.destroy
    redirect_to @user
  end

  private
    def post_params
      post_info = params.require(:post).permit(:title, :content, :words_counted, :count, :init_rating, :end_rating)
      post_params = post_info.merge({user_id: current_user.id})
    end

    def post_id
      params[:id]
    end

end
