class HotelDecorator < ApplicationDecorator
  delegate :id, :name, :address, :stars, :rating, :longitude, :latitude, :city_id

  def distance_humanize
    format(I18n.t(:distance, scope: "decorators.hotel"), distance: rounded_distance)
  end

  private

  def rounded_distance
    object.distance.round(1) if object.respond_to?(:distance)
  end
end
