module ApplicationHelper

  # helper_method: :current_user, :logged_in?
  def admin?
    @current_user.admin?
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
end
