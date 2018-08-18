class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: Identity::AVALIABLE_PROVIDERS

  has_many :identities, dependent: :destroy

  validates :full_name, :role, presence: true

  enum role: { user: "user", admin: "admin" }
end
