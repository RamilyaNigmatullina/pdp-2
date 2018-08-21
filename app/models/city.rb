class City < ApplicationRecord
  include PgSearch
  include ReindexMultisearchTable

  multisearchable against: %i[name country]

  has_many :hotels, dependent: :destroy

  validates :name, presence: true
end
