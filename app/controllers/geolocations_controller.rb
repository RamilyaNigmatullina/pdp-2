class GeolocationsController < ApplicationController
  def create
    cookies[:geolocation] = geolocation_params.values
  end

  def destroy
    cookies.delete(:geolocation)
  end

  private

  def geolocation_params
    params.fetch(:geolocation).permit(:latitude, :longitude)
  end
end
