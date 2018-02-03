class UsersController < ApplicationController

  layout 'auth'

  helper_method :resource_user

  skip_filter :require_user
  before_filter :require_no_user, only: [:new]

  def new
  end

  def create
    if resource_user.save
      redirect_to root_url
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
