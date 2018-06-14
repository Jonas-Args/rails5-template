class Car < ApplicationRecord

  belongs_to :driver, class_name: 'User', foreign_key: 'driver_id'

  has_many :car_attributes, dependent: :destroy
  has_many :rates, dependent: :destroy

  belongs_to :car_model, optional: true
  belongs_to :address, optional: true

  accepts_nested_attributes_for :car_attributes
  accepts_nested_attributes_for :rates

  validates :car_attributes, :presence => true
  validates :rates, :presence => true

end
