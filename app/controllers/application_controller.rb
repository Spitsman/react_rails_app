class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user
  before_action :load_authlogic

  helper_method :current_user

  def load_authlogic
    Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
  end

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

  def require_no_user
    if current_user.present? && current_user.email_confirmed?
      redirect_to current_user.admin? ? admin_url : root_url
    end
  end

end
