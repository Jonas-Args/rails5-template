class ApiController < ActionController::Base
  include ApiExceptions
  include Authenticator
  include CommonAction
  include CommonResponse

  protect_from_forgery with: :null_session
  before_action :authenticate_request

  def authenticate_request
    fail ExpiredSessionError unless current_user.present?
  end
end
