FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name 'user_name'
    password 'password'

    trait :driver do
      after(:create) do |user|
        user.add_role :driver
      end
    end

    trait :inactive do
      is_active false
    end

    factory :user_driver_role, traits: [:driver]
    factory :user_inactive, traits: [:inactive]

  end

end
