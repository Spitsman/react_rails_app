class UsersController < ApplicationController

  layout 'auth'

  helper_method :resource_user

  skip_filter :require_user

  def new
  end

  def create
    if resource_user.save
      UserMailer.registration_confirmation(resource_user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to sign_in_url
    else
      render action: :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user.present?
      user.email_activate!
      flash[:success] = "Your email has been confirmed. Please sign in to continue."
      redirect_to sign_in_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to sign_in_url
    end
  end

  protected

  def resource_user
    @resource_user ||= User.new(user_params)
  end

  def user_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end