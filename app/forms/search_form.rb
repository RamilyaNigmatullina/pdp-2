class SearchForm
  include ActiveModel::Model

  attr_accessor :search, :stars, :min_rating, :max_rating, :radius, :coordinates

  validates :stars_amount, numericality: { only_integer: true, allow_blank: true }
  validates :min_rating, :max_rating, :radius, numericality: { allow_blank: true }
end
