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
    HotelDecorator.decorate_collection(filtered_hotels, context: { coordinates: current_coordinates })
  end

  def authorize_resource
    authorize hotel
  end

  def filtered_hotels
    ::FilteredHotels.new(Hotel.includes(:city).all, filter_params).all.page(params[:page])
  end

  def filter_params
    params.fetch(:hotel, {})
          .permit(:search, :stars, :min_rating, :max_rating, :radius)
          .merge(coordinates: current_coordinates).to_h
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :longitude, :latitude, :rating, :stars, :city_id)
  end
end
