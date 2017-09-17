class Admin::UsersController < Admin::BaseController

  helper_method :resource_user, :users_collection

  def new
  end

  def create
    if resource_user.save
      UserMailer.registration_confirmation(resource_user).deliver
      flash[:success] = "Please confirm new manager`s email address to activate account"
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  protected

  def users_collection
    @users_collection ||= User.admins
  end

  def resource_user
    return @resource_user if defined? @resource_user
    @resource_user = User.new(user_params)
    @resource_user.admin = true
    @resource_user
  end

  def user_params
    params.fetch(:user, {}).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end