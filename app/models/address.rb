class Address < ApplicationRecord

  belongs_to :car, optional: true
end
