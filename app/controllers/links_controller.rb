class LinksController < ApplicationController
  before_filter :authorize

  def index
  end

  private

  def require_user
    unless current_user?
      flash[:notice] = "You must Log In or Sign Up to continue"
      redirect_to new_user_path
    end
  end
end
