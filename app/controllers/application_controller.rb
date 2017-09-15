class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user

  helper_method :current_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    redirect_to sign_in_url if current_user.nil?
  end

  def require_admin
    require_user
    redirect_to root_path unless current_user.admin?
  end

  def require_client
    require_user
    redirect_to admin_url unless current_user.client?
  end

end
