class Mailers::UserMailerWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'sparkpost_mailer'

  def perform( user_id=nil, todo)
    user = User.find_by(id: user_id)
    case todo
    when 'send_welcome_email'
      UserMailer.send_welcome_email(user).deliver_now
    when 'send_forgot_password_email'
      UserMailer.send_forgot_password_email(user).deliver_now
    end
  end
end
