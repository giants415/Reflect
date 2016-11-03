class UsersController < ApplicationController
  include SessionsHelper

  before_action :logged_in?, only: [:index]
  before_filter :validate_user, only: [:create, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        redirect_to @user
      else
        flash[:error]= @user.errors.full_messages
        redirect_to new_user_path
      end
  end

  def show
    @user = User.find_by_id(user_id)
    @posts = Post.where(user_id: user_id)
    @posts = @user.posts.page(params[:page]).per(1)
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

    def validate_user
      redirect_to(signup_path) unless current_user == User.find_by_id(user_id)
      flash[:notice] = "Please sign up or log in to begin reflecting"
    end

end
