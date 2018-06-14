class UserMailer < ApplicationMailer
  def send_welcome_email user
    @user = user
    mail(to: @user.email, subject: 'Welcome')
  end

  def send_forgot_password_email user
    @user = user
    @reset_url = "http://#{ENV['CLIENT_URL']}/reset/#{user.forgot_tokens.last.token}"
    mail(to: @user.email, subject: 'Password Reset')
  end
end
