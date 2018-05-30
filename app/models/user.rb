class User < ApplicationRecord
  include Authenticatable
  include TokenProcessor

  attr_accessor :current_token

  validates :email, uniqueness: true, presence: true, email: true
  validates :user_name, presence: true

  has_many :access_tokens,  class_name: "Token::AccessToken", :dependent => :destroy
  has_many :invite_tokens,  class_name: "Token::InviteToken", :dependent => :destroy
  has_many :forgot_tokens,  class_name: "Token::ForgotToken", :dependent => :destroy

  def self.find_by_credentials(credentials)
    user = find_by(email: credentials.fetch(:email, '')) if credentials[:email].present?
  user = find_by(username: credentials.fetch(:username, '')) if credentials[:username].present?
    return false unless user.present? && user.valid_password?(credentials.fetch(:password, ''))
    user
  end

  def assign_temporary_password temporary_password
    assign_token :reset_password_token
    update_attributes!(temporary_password: temporary_password, reset_password_token_sent_at: Time.now)
  end

  def reset_password(pw)
    self.forgot_tokens.destroy_all
    return true if self.update!(password: pw)
    false
  end

end
