PgSearch.multisearch_options = {
  using: {
    tsearch: {},
    trigram: {
      threshold: 0.3
    }
  },
  ignoring: :accents
}
