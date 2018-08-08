module TimezoneSetter
  extend ActiveSupport::Concern

  included do
    around_action :timezone=
  end

  private

  def timezone=(&block)
    Time.use_zone(timezone, &block)
  end

  def timezone
    current_user&.timezone || geolocation_timezone
  end

  def geolocation_timezone
    Timezone.lookup(*current_coordinates).name
  end
end
