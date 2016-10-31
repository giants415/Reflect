class CloudController < ApplicationController

  def index
    @posts = Post.where(id: params[:post_id])
  end

  # private

  # def post_id
  #   params[:id]
  # end

end
