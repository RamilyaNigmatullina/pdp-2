class Identity < ApplicationRecord
  AVALIABLE_PROVIDERS = %w[google_oauth2 facebook].freeze

  belongs_to :user

  validates :provider, :uid, presence: true
  validates :provider, inclusion: { in: AVALIABLE_PROVIDERS }
  validates :uid, uniqueness: { scope: :provider }
end
