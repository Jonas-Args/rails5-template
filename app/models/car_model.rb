class CarModel < ApplicationRecord

  has_many :cars, dependent: :destroy

  def self.permitted_params
    attribute_names
  end
end
