FactoryGirl.define do
  factory :omniauth, class: OmniAuth::AuthHash do
    uid { SecureRandom.uuid.first(7) }

    transient do
      email { Faker::Internet.email }
      name { Faker::Name.name }
    end

    info do
      {
        email: email,
        name: name
      }
    end

    trait :facebook do
      provider "facebook"
    end

    trait :google do
      provider "google_oauth2"
    end
  end
end
