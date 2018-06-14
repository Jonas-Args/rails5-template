class PerPayment < ApplicationRecord

  belongs_to :car, optional: true

  def self.permitted_params
    attribute_names
  end
end
