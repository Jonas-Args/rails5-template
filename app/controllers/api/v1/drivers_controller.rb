class Api::V1::DriversController < ApiController
 include UserAction

  def create
    user = User.new(obj_params)
    if user.save
      user.add_role :driver
      render_user_details user
    else
      obj_errors user
    end
  end


end
