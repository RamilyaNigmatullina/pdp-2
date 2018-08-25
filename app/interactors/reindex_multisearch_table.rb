class ReindexMultisearchTable
  include Interactor

  delegate :record, to: :context

  def call
    reindex_multisearch_table if search_attributes_changed? || record_deleted?
  end

  private

  def reindex_multisearch_table
    PgSearch::Multisearch.rebuild(record.class)
  end

  def search_attributes_changed?
    record.previous_changes.slice(*search_attributes).any?
  end

  def record_deleted?
    !record.class.exists?(record.id)
  end

  def search_attributes
    record.class::SEARCH_ATTRIBUTES
  end
end
