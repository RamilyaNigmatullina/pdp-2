class City < ApplicationRecord
  include PgSearch

  multisearchable against: %i[name country]

  has_many :hotels, dependent: :destroy

  validates :name, presence: true

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(City)
  end
end
