module Roles
  extend ActiveSupport::Concern

  def add_role user, role=nil
    case role
    when 'role1'    #compare to 1
      # user.add_role :driver
    when 'role2'    #compare to 2
      # user.add_role :admin
    else
      user.add_role :user
    end
  end

end
