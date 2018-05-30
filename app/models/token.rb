class Token < ApplicationRecord
  belongs_to :user
  self.inheritance_column = :type

  def self.types
      %w(AccessToken ForgotToken InviteToken)
  end

end
