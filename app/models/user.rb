class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  validates :full_name, presence: true

  has_many :user_authentications
end
