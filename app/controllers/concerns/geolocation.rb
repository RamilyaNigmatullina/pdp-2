module Geolocation
  extend ActiveSupport::Concern

  included do
    def current_coordinates
      @current_coordinates ||= from_cookies || from_request
    end
  end

   private

   def from_cookies
     return unless cookies[:geolocation]

     cookies[:geolocation].split(",")
   end

   def from_request
     request.location.data["loc"].split(",")
  end
end
