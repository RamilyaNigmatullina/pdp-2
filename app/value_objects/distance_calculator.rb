class DistanceCalculator
  EARTH_RADIUS_KM = 6_371
  RADIUS_PER_DEGREE = Math::PI / 180
  AVAILABLE_MEASURES = %i[m km]
  INVALID_MEASURE_ERROR = "Measure is not included in the list: %<available_measures>s".freeze

  def initialize(coordinates_1:, coordinates_2:, measure:)
    @latitude_1, @longitude_1 = coordinates_1
    @latitude_2, @longitude_2 = coordinates_2
    @measure = measure
  end

  def distance
    return invalid_measure_error unless measure_valid?

    calculated_distance * earth_radius_in_measure
  end

  private

  attr_reader :latitude_1, :longitude_1, :latitude_2, :longitude_2, :measure

  def calculated_distance # Haversine formula
    2 * Math::atan2(Math::sqrt(value), Math::sqrt(1 - value))
  end

  def value
    Math.sin(in_radius(latitude_2 - latitude_1) / 2)**2 +
    Math.cos(in_radius(latitude_1)) *
    Math.cos(in_radius(latitude_2)) *
    Math.sin(in_radius(longitude_2 - longitude_1) / 2)**2
  end

  def in_radius(value)
    value * RADIUS_PER_DEGREE
  end

  def earth_radius_in_measure
    case measure
    when :km then EARTH_RADIUS_KM
    when :m then EARTH_RADIUS_KM * 1_000
    end
  end

  def measure_valid?
    AVAILABLE_MEASURES.include?(measure)
  end

  def invalid_measure_error
    format(INVALID_MEASURE_ERROR, available_measures: AVAILABLE_MEASURES.join(", "))
  end
end
