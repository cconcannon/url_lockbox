class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    session[:user_id]
  end

  def authorize
    unless current_user?
      flash[:notice] = "You must be logged in to continue!"
      redirect_to new_session_path
    end
  end
end
