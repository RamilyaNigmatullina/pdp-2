FactoryGirl.define do
  factory :user_authentication do
    provider "facebook"
    uid { Faker::Number.number(7) }
    user
  end
end
