PgSearch.multisearch_options = {
  using: {
    tsearch: {},
    trigram: {
      threshold: 0.1
    }
  },
  ignoring: :accents
}
