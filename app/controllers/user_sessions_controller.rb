class UserSessionsController < ApplicationController

  layout 'auth'

  skip_filter :require_user, except: [:destroy]
  before_filter :require_no_user, only: [:new]

  helper_method :resource_session

  def new
  end

  def create
    if resource_session.save
      if current_user.email_confirmed
        flash[:notice] = 'You signed in'
        if current_user.client?
          redirect_to root_url
        else
          redirect_to admin_url
        end
      else
        flash[:error] = 'You should activate your account before sign in. Check your email.'
        render action: :new
      end
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to sign_in_url
  end

protected

  def resource_session
    @resource_session ||= UserSession.new(user_session_params)
  end

  def user_session_params
    params.fetch(:user_session, {}).permit(:email, :password, :remember_me)
  end

end