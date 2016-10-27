class PostsController < ApplicationController
  include SessionsHelper

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    counter = WordsCounted.count(@post.content, {exclude: "enim"})
    @post.words_counted = counter.token_count
    @post.words_freq = counter.token_frequency
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
      post_info = params.require(:post).permit(:title, :content, :words_counted, :count)
      post_params = post_info.merge({user_id: current_user.id})
    end

    def post_id
      params[:id]
    end

end
