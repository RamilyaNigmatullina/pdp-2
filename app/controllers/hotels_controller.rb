class HotelsController < ApplicationController
  expose_decorated :hotels, :decorated_hotels

  helper_method :filter_params

  def index
  end

  private

  def decorated_hotels
    HotelDecorator.decorate_collection(filtered_hotels, context: { coordinates: current_coordinates })
  end

  def filtered_hotels
    ::FilteredHotels.new(Hotel.includes(:city).all, filter_params).all
  end

  def filter_params
    params.fetch(:hotel, {})
          .permit(:search, :stars, :min_rating, :max_rating, :radius)
          .merge(coordinates: current_coordinates).to_h
  end
end
