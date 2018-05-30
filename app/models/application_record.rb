class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def assign_token(attr, scope={})
    loop do
      scope[attr] = SecureRandom.uuid
      next if self.class.exists?(scope)

      assign_attributes(scope)
      break
    end
  end

end
