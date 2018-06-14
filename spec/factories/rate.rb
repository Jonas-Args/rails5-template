FactoryBot.define do
  factory :rate do

    trait :daily do
      per "Day"
      price 10
    end

    factory :rate_daily, traits: [:daily]
  end

end
