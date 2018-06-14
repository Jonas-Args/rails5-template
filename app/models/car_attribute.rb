class CarAttribute < ApplicationRecord
  belongs_to :car, optional: true
end
