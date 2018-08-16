FactoryGirl.define do
  factory :identity do
    provider "facebook"
    uid { Faker::Number.number(7).to_s }
    user
  end
end
