class UserMailer < ActionMailer::Base
  default :from => "noreply@testapp.com"

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.decorate.display_name} <#{user.email}>", subject: "Registration Confirmation")
  end

  def answer_notification(request, manager)
    @request = request; @manager = manager
    request.users.each do |user|
      @user = user
      mail(to: "#{user.decorate.display_name} <#{user.email}>", subject: "Your request was answered")
    end
  end

end