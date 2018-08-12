FactoryGirl.define do
  factory :authentication_hash, class: OmniAuth::AuthHash do
    uid "1234567"
    provider "facebook"

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
  end
end
