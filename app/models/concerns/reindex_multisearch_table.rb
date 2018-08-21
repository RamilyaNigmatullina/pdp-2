module ReindexMultisearch
  extend ActiveSupport::Concern

  included do
    after_save :reindex
  end

  private

  def reindex
    PgSearch::Multisearch.rebuild(self.name)
  end
end
