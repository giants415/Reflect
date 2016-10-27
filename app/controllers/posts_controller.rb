class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post.create(post_params)
    redirect_to posts_path
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
    redirect_to post_path
  end

  def destroy
    @post = Post.find_by_id(post_id)
    @post.destroy
    redirect_to @user
  end

  private
    def post_params
      post_params = params.require(:post).permit(:title, :content)
    end

end
