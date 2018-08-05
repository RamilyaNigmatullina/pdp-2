class FilteredHotels
  SEARCH_SQL = <<-SQL.freeze
    lower(hotels.name) similar to lower(:search) ESCAPE '^' OR
    lower(cities.name) similar to lower(:search) ESCAPE '^'
  SQL

  attr_reader :relation, :filter_params
  private :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params
  end

  def all
    filter_params.reduce(relation) do |relation, (key, value)|
      next relation if value.blank?

      send("by_#{key}", relation, value)
    end
  end

  private

  def by_search(relation, search)
    relation.joins(:city).where(SEARCH_SQL, search: search)
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

  def by_radius(relation, params)
    return relation unless required_keys_present?(params)

    relation.near(coordinates(params), params[:radius])
  end

  def required_keys_present?(params)
    %i[latitude latitude radius].all? { |key| params[key].present? }
  end

  def coordinates(params)
    [params[:latitude], params[:longitude]]
  end
end
