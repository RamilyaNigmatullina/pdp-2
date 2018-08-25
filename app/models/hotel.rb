class Hotel < ApplicationRecord
  include PgSearch

  SEARCH_ATTRIBUTES = %i[name address].freeze

  multisearchable against: SEARCH_ATTRIBUTES

  geocoded_by %i[latitude longitude]

  belongs_to :city

  validates :name, :address, :latitude, :longitude, :rating, :stars, presence: true
  validates :name, uniqueness: { scope: :city_id }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
