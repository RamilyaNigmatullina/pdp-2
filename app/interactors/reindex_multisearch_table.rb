class ReindexMultisearchTable
  include Interactor

  delegate :record, to: :context

  def call
    reindex_multisearch_table if searchable_attributes_changed? || record_deleted?
  end

  private

  def reindex_multisearch_table
    PgSearch::Multisearch.rebuild(record.class)
  end

  def searchable_attributes_changed?
    record.previous_changes.slice(*searchable_attributes).any?
  end

  def record_deleted?
    !record.class.exists?(record.id)
  end

  def searchable_attributes
    record.class::SEARCHABLE_ATTRIBUTES
  end
end
