class HotelDecorator < ApplicationDecorator
  delegate :id, :name, :address, :stars, :rating, :longitude, :latitude, :city_id, :check_in_time

  def distance_humanize
    return "-" unless object.respond_to?(:distance)

    format(I18n.t(:distance, scope: "decorators.hotel"), distance: rounded_distance)
  end

  def check_in_time
    return unless object.check_in_time

    I18n.l(object.check_in_time, format: :time)
  end

  private

  def rounded_distance
    object.distance.round(1)
  end
end
