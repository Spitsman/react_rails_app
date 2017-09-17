class UserMailer < ActionMailer::Base
  default :from => "noreply@testapp.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.decorate.display_name} <#{user.email}>", :subject => "Registration Confirmation")
  end

end