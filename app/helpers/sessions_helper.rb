module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logged_in?
    if current_user == nil
      redirect_to new_session_path
    end
  end
end
