class CloudController < ApplicationController

  def index
    @posts = Post.where(post_id: post_id)
  end

  private

  def post_id
    params[:id]
  end

end
