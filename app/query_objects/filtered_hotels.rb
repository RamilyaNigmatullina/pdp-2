class FilteredHotels
  ALLOWED_PARAMS = %i[search stars min_rating max_rating near].freeze
  DEFAULT_RADIUS = 40_000

  SEARCH_SQL = <<-SQL.freeze
    lower(hotels.name) similar to lower(:search) ESCAPE '^'
  SQL

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
    relation.where(SEARCH_SQL, search: search)
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

    relation.near(near_params[:coordinates], near_params[:radius] || DEFAULT_RADIUS)
  end
end
