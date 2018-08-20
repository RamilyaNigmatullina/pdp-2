module Geolocation
  extend ActiveSupport::Concern

  included do
    binding.pry
    after_save :reindex
  end

  private

  def reindex
    PgSearch::Multisearch.rebuild(self.class.name)
  end
end
