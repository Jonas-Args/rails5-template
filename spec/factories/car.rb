FactoryBot.define do
  factory :car do
    association :car_model, factory: :car_model
    association :driver, factory: :user_driver_role

    after :build do |car|
      car.rates << FactoryBot.build_list(:rate_daily,1)
      car.car_attributes << FactoryBot.build_list(:car_attribute,1)
    end

    # before(:create) do |car|
    #   create(:rate_daily, car: car)
    #   create(:car_attribute, car: car)
    # end
  end

end
