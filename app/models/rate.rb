class Rate < ApplicationRecord
  validates :per, uniqueness: { scope:  [:price, :car_id] }
  validates :price, :numericality => { :only_integer => true }
  belongs_to :car, optional: true

end
