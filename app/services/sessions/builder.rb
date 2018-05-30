module Sessions
  class Builder
    def initialize current_user
      @current_user = current_user
      @current_user.set_access_token
    end

    def basic_details
      access_token_details
      .merge(
        {
          user: {
            email: @current_user.email,
            username: @current_user.user_name,
          }
        }
      )
    end

      def access_token_details
      {
        id: @current_user.id,
        access_token: @current_user.current_token,
      }
    end

  end
end
