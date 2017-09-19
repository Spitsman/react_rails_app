class RegistrationRemindWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)

    return if user.email_confirmed

    UserMailer.registration_confirmation_reminder(user).deliver

    User.admins.each do |admin|
      UserMailer.unconfirmed_user_reminder(user, admin).deliver
    end
  end
end