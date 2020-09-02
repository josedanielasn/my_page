class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  def admin_user
    @current_user = User.find(session[:user_id])
    @current_user.admin?
    redirect_to users_path
  end
end
