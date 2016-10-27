class SessionsController < ApplicationController
  include SessionsHelper


  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Issue with logging in, try again."
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
