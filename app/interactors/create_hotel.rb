class CreateHotel
  include Interactor::Organizer

  organize Hotels::Save,
    ReindexMultisearchTable
end
