class HotelDecorator < ApplicationDecorator
  delegate :id, :name, :address, :stars, :rating, :latitude, :longitude, :city_id, :check_in_time
  delegate :distance, to: :distance_calculator

  def distance_humanize
    format(I18n.t(:distance, scope: "decorators.hotel"), distance: rounded_distance)
  end

  def check_in_time
    return unless object.check_in_time

    I18n.l(object.check_in_time, format: :time)
  end

  private

  def rounded_distance
    distance.round(1)
  end

  def distance_calculator
    DistanceCalculator.new(current_coordinates, [latitude, longitude])
  end
end
