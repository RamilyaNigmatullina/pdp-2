class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include Geolocation
  include TimezoneSetter

  around_action :define_timezone

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  private

  def define_timezone(&block)
    binding.pry
    Time.use_zone(timezone, &block)
  end

  def timezone
    current_user&.timezone || geolocation_timezone
  end

  def geolocation_timezone
    Timezone.lookup(*current_coordinates).name
  end
end
