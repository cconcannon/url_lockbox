class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert]
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
