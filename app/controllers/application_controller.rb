class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    session[:user_id]
  end

  def authorize
    unless user_logged_in?
      flash[:notice] = "You must be logged in to continue!"
      redirect_to new_session_path
    end
  end
end
