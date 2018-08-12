class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, :role, presence: true

  enum role: { user: "user", admin: "admin" }
end
