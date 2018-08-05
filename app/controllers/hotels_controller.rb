class HotelsController < ApplicationController
  expose_decorated :hotels, :decorated_hotels

  helper_method :filter_params

  def index
  end

  private

  def decorated_hotels
    HotelDecorator.decorate_collection(filtered_hotels, context: { coordinates: coordinates.values })
  end

  def filtered_hotels
    ::FilteredHotels.new(Hotel.includes(:city).all, filter_params).all
  end

  def filter_params
    params.fetch(:hotel, {}).permit(:search, :stars, :min_rating, :max_rating, :radius).to_h.tap do |hash|
      hash[:radius] = hash.slice(:radius).merge(coordinates)
    end
  end

  def coordinates
    @coordinates ||= {
      latitude: geocoder.latitude,
      longitude: geocoder.longitude
    }
  end

  def geocoder
    @geocoder ||= Geocoder.search(request.ip).first
  end
end
