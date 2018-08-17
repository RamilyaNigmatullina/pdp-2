class Hotel < ApplicationRecord
  geocoded_by %i[latitude longitude]

  belongs_to :city

  validates :name, :address, :longitude, :latitude, :rating, :stars, :city_id, presence: true
  validates :name, uniqueness: { scope: :city_id }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
