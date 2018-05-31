class UserMailer < ApplicationMailer
  def send_welcome_email user
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def send_forgot_password_email user
    @user = user
    @reset_url = "http://#{ENV['CLIENT_URL']}/reset/#{user.forgot_tokens.last.token}"
    mail(to: @user.email, subject: 'Reset Password')
  end
end
