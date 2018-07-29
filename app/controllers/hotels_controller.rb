class HotelsController < ApplicationController
  expose :hotels, :filtered_hotels

  helper_method :filter_params

  def index
  end

  private

  def filtered_hotels
    ::FilteredHotels.new(Hotel.includes(:city).all, filter_params).all
  end

  def filter_params
    params.fetch(:hotel, {}).permit(:search, :stars, :min_rating, :max_rating).to_h
  end
end
