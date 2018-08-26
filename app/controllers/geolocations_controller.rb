class GeolocationsController < ApplicationController
  skip_verify_authorized only: :show

  def show
    result = Geocoder.search(params[:address]).first

    render json: { latitude: result&.latitude, longitude: result&.longitude }
  end
end
