class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  has_many :identities, dependent: :destroy

  validates :full_name, :role, presence: true

  enum role: { user: "user", admin: "admin" }
end
