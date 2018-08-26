class HotelsController < ApplicationController
  before_action :authorize_resource!

  expose_decorated :hotels, :fetch_hotels
  expose_decorated :hotel
  expose :search_form, -> { SearchForm.new(search_form_params) }

  helper_method :filter_params

  def index
  end

  def new
  end

  def create
    self.hotel = CreateHotel.call(record: hotel).record

    respond_with hotel, location: hotels_path
  end

  def edit
  end

  def update
    self.hotel = UpdateHotel.call(record: hotel, record_params: hotel_params).record

    respond_with hotel, location: hotels_path
  end

  def destroy
    self.hotel = DestroyHotel.call(record: hotel).record

    respond_with hotel
  end

  private

  def fetch_hotels
    FilteredHotels.new(Hotel.all, filter_params).all.page(params[:page])
  end

  def authorize_resource!
    authorize! hotel
  end

  def filter_params
    search_form_params.merge(near: near_params).to_h
  end

  def near_params
    {
      radius: params.dig(:hotel, :radius),
      coordinates: current_coordinates
    }
  end

  def search_form_params
    params.fetch(:search_form, {}).permit(:search, :stars, :min_rating, :max_rating, :radius)
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :longitude, :latitude, :rating, :stars, :city_id, :check_in_time)
  end
end
