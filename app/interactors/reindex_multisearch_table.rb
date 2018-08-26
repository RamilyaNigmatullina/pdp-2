class ReindexMultisearchTable
  include Interactor

  delegate :record, to: :context
  delegate :class, :id, to: :record, prefix: true

  def call
    reindex_multisearch_table if searchable_attributes_changed? || record_deleted?
  end

  private

  def reindex_multisearch_table
    PgSearch::Multisearch.rebuild(record_class)
  end

  def searchable_attributes_changed?
    record.previous_changes.slice(*searchable_attributes).any?
  end

  def record_deleted?
    !record_class.exists?(record_id)
  end

  def searchable_attributes
    record_class::SEARCHABLE_ATTRIBUTES
  end
end
