class HotelsController < ApplicationController
  expose_decorated :hotels, :decorated_hotels
  expose :hotel

  before_action :authorize_resource

  helper_method :filter_params

  def index
  end

  def new
  end

  def create
    hotel.save

    respond_with hotel, location: hotels_path
  end

  def edit
  end

  def update
    hotel.update(hotel_params)

    respond_with hotel, location: hotels_path
  end

  def destroy
    hotel.destroy

    respond_with hotel, location: hotels_path
  end

  private

  def decorated_hotels
    HotelDecorator.decorate_collection(filtered_hotels)
  end

  def filtered_hotels
    ::FilteredHotels.new(fetch_hotels, filter_params).all
  end

  def fetch_hotels
    Hotel.includes(:city).page(params[:page])
  end

  def authorize_resource
    authorize hotel
  end

  def filter_params
    hotel_params.permit(:search, :stars, :min_rating, :max_rating).merge(near: near_params).to_h
  end

  def near_params
    {
      radius: hotel_params[:radius],
      coordinates: current_coordinates
    }
  end

  def hotel_params
    params.fetch(:hotel, {}).permit(:name, :address, :longitude, :latitude, :rating,
      :stars, :city_id, :search, :min_rating, :max_rating)
  end
end
