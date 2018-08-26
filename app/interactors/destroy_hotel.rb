class DestroyHotel
  include Interactor::Organizer

  organize Hotels::Destroy,
    ReindexMultisearchTable
end
