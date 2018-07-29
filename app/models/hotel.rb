class Hotel < ApplicationRecord
  belongs_to :city

  validates :name, :address, :longitude, :latitude, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
