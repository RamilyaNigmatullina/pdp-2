module TimeHelper
  def current_time
    I18n.l(Time.current, format: :time)
  end

  def timezone
    Time.zone.name
  end
end
