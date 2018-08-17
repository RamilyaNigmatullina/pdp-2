FactoryGirl.define do
  factory :identity do
    provider "facebook"
    uid { SecureRandom.uuid.first(7) }
    user
  end
end
