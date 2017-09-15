class UsersController < ApplicationController

  layout 'clean'

  helper_method :resource_user

  skip_filter :require_user, except: [:destroy]

  def new
  end

  def create
    if resource_user.save
      redirect_to sign_in_url
    else
      render action: :new
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