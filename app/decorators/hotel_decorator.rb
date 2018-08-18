class HotelDecorator < ApplicationDecorator
  delegate :id, :name, :address, :stars, :rating, :longitude, :latitude, :city_id

  def distance_humanize
    return "-" unless object.respond_to?(:distance)

    format(I18n.t(:distance, scope: "decorators.hotel"), distance: rounded_distance)
  end

  private

  def rounded_distance
    object.distance.round(1)
  end
end
