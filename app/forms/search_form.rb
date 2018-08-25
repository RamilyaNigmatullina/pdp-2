class SearchForm
  include ActiveModel::Model

  attr_accessor :search, :stars, :min_rating, :max_rating, :radius
end
