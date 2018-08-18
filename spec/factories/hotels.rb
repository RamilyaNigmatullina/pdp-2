FactoryGirl.define do
  factory :hotel do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    rating { Faker::Number.between(1, 10) }
    stars { rand(1..5) }
    check_in_time { Time.zone.parse("2018-08-07 14:00:00") }
    city
  end
end
