class UserMailer < ActionMailer::Base
  default :from => "noreply@testapp.com"

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.decorate.display_name} <#{user.email}>", subject: "Registration Confirmation")
  end

  def answer_notification(user, request, manager)
    @user = user; @request = request; @manager = manager
    mail(to: "#{user.decorate.display_name} <#{user.email}>", subject: "Your request was answered")
  end

  def registration_confirmation_reminder(user)
    @user = user
    mail(to: "#{user.decorate.display_name} <#{user.email}>", subject: "You still not confirmed your email")
  end

  def unconfirmed_user_reminder(user, manager)
    @user = user; @manager = manager
    mail(to: "#{manager.decorate.display_name} <#{manager.email}>", subject: "Unconfirmed user")
  end

end