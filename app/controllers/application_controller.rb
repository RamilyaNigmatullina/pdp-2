class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include Geolocation

  protect_from_forgery with: :exception

  around_action :timezone=

  responders :flash
  respond_to :html

  private

  def timezone=(&block)
    Time.use_zone(timezone, &block)
  end

  def timezone
    current_user&.timezone.presence || geolocation_timezone
  end

  def geolocation_timezone
    Timezone.lookup(*current_coordinates).name
  end
end
