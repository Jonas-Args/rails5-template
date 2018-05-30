class Api::V1::SessionsController < ApiController

  skip_before_action :authenticate_request, only: :create
  before_action :find_obj, except: [:index,:create,:destroy, :show]

  def create
    @user = User.find_by_credentials(params[:user])
    if @user.present? && @user.set_access_token
      render_user_details @user
    else
      fail InvalidCredentialsError
    end
  end

  def show
    render_user_details current_user
  end

  def destroy
    if current_user.destroy_token
      render_success
    else
      fail InvalidRequestError
    end
  end

  private

  def render_user_details user
    render json: Sessions::Builder.new(user).basic_details
  end

end
