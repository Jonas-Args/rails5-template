class Token < ApplicationRecord
  default_scope { where(active: true) }

  belongs_to :user
  self.inheritance_column = :type

  def self.types
      %w(AccessToken ForgotToken InviteToken)
  end

end
