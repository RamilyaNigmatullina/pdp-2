FactoryGirl.define do
  factory :identity do
    uid { SecureRandom.uuid.first(7) }
    user

    trait :facebook do
      provider "facebook"
    end

    trait :google do
      provider "google_oauth2"
    end
  end
end
