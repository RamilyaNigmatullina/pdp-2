class HotelDecorator < ApplicationDecorator
  DISTANCE_TEXT = "%<distance>s km".freeze

  delegate :id, :name, :address, :stars, :rating

  def distance_text
    format(DISTANCE_TEXT, distance: rounded_distance)
  end

  private

  def rounded_distance
    object.distance_to(context[:coordinates]).round(1)
  end
end
