module CommonScopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_limit page, limit
      page = page || 1
      limit(limit).offset(limit*(page.to_i-1))
    end
  end

end
