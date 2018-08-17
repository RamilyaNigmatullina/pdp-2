class HotelsController < ApplicationController
  before_action :authorize_resource

  expose_decorated :hotels, :fetch_hotels
  expose_decorated :hotel

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

    respond_with hotel
  end

  private

  def fetch_hotels
    FilteredHotels.new(Hotel.all, filter_params).all.page(params[:page])
  end

  def authorize_resource
    authorize hotel
  end

  def filter_params
    params.fetch(:hotel, {}).permit(:search, :stars, :min_rating, :max_rating).merge(near: near_params).to_h
  end

  def near_params
    {
      radius: params.dig(:hotel, :radius),
      coordinates: current_coordinates
    }
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :longitude, :latitude, :rating, :stars, :city_id, :check_in_time)
  end
end
