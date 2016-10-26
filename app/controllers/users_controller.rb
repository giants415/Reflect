class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find_by_id(user_id)
    @posts = Post.where(user_id: user_id)
  end

  def edit
    @user = User.find_by_id(user_id)
  end

  def update
    user = User.find_by_id(user_id)
    user.update_attributes(user_params)
    redirect_to user_path(user)
  end


  private
    def user_params
      params.require(:user).permit(:email, :password, :username)
    end

    def user_id
      params[:id]
    end
end
