class GeolocationController < ApplicationController
  def show
    result = Geocoder.search(params[:address]).first

    render json: { latitude: result&.latitude, longitude: result&.longitude }
  end
end
