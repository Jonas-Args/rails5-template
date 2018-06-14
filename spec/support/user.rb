def current_user
  return @user if @user.present?
  @user ||= FactoryBot.create(:user, password: "!123OnePassword")
  @user.set_access_token
  @user
end

def current_driver
  return @user if @user.present?
  @user ||= create(:user_driver_role)
  @user.set_access_token
  @user
end
