module Sessions
  class Builder
    def initialize current_user
      @current_user = current_user
      @current_user.set_access_token
    end

    def basic_details

        {
          user: {
                    email: @current_user.email,
                    username: @current_user.user_name,
                    is_active: @current_user.is_active
                  }.merge(access_token_details)
        }
    end

      def access_token_details
      {
        id: @current_user.id,
        access_token: @current_user.current_token,
      }
    end

  end
end
