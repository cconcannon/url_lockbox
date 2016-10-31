class UsersController < ApplicationController
  def new
  end

  def create
    validate_password_confirmation
  end

  private

  def determine_user_validation_error
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def validate_password_confirmation
    if params[:user][:password] != params[:user][:password_confirm]
      flash[:notice] = "Error: Password did not match"
      redirect_to new_user_path
    else
      validate_user_creation
    end
  end

  def validate_user_creation
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Error: Email is already in use"
      redirect_to new_user_path
    end
  end
end
