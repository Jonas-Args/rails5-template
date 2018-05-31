class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create, :forgot_password, :reset_password]

  def create
    user = User.new(obj_params)
    if user.save
      render_user_details user
    else
      obj_errors user
    end
  end

  def update
    user = current_user
    if user.update_attributes(obj_params)
      render_user_details user
    else
      obj_errors user
    end
  end

  def inactive
    user = current_user
    if user.update_attributes(is_active: false)
      render_success
    else
      obj_errors user
    end
  end

  def forgot_password
    user = User.find_by_email(params[:email].downcase)
    if user.present?
      user.set_forgot_token
      RedisJobPusher.push_send_forgot_password_email(user.id)
      render_success
    else
      fail ApiExceptions::InvalidEmailError
    end
  end

  def reset_password
    user = User.find_by_valid_token(params)
    unless user.present?
      fail ApiExceptions::InvalidTokenError
    else
      if user.reset_password(params[:password]) && user.set_access_token
        render_user_details user
      else
        render_error('Failed to reset password', 422)
      end
    end
  end

  private

  def render_user_details user
    render json: Sessions::Builder.new(user).basic_details
  end

  def resource_name
    'User'
  end

  def obj_params
    params.require(:user).permit(*%i(
      user_name
      first_name
      last_name
      email
      password
    ))
  end
end
