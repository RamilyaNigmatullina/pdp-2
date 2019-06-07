class FilteredHotels
  ALLOWED_PARAMS = %i[search stars min_rating max_rating near].freeze
  DEFAULT_RADIUS = 40_000

  attr_reader :relation, :filter_params
  private :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params
  end

  def all
    filter_params.slice(*ALLOWED_PARAMS).reduce(relation) do |relation, (key, value)|
      next relation if value.blank?

      send("by_#{key}", relation, value)
    end
  end

  private

  def by_search(relation, search)
    hotel_ids = pg_search_results(search, "Hotel")
    city_ids = pg_search_results(search, "City")

    relation.where(id: hotel_ids).or(relation.where(city_id: city_ids))
  end

  def pg_search_results(search, searchable_type)
    @pg_search_result ||= PgSearch.multisearch(search)

    @pg_search_result.where(searchable_type: searchable_type).map(&:searchable_id)
  end

  def by_stars(relation, stars)
    relation.where(stars: stars.to_i)
  end

  def by_min_rating(relation, min_rating)
    relation.where("hotels.rating >= ?", min_rating.to_f)
  end

  def by_max_rating(relation, max_rating)
    relation.where("hotels.rating <= ?", max_rating.to_f)
  end

  def by_near(relation, near_params)
    return relation unless near_params[:coordinates].all?

    hotels = hotels_with_distance(relation, near_params).compact
    hotel_ids = hotels.map { |hotel| hotel[:hotel_id] }
    relation.where(id: hotel_ids)
  end

  def hotels_with_distance(relation, near_params)
    relation.map do |hotel|
      distance = distance_beetwen(near_params, hotel)

      { hotel_id: hotel.id, distance: distance } if distance <= near_params[:radius]
    end
  end

  def distance_beetwen(near_params, hotel)
    DistanceCalculator.new(near_params[:coordinates], [hotel.latitude, hotel.longitude]).distance
  end
end
