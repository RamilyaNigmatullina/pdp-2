class CreateHotel
  include Interactor::Organizer

  organize Hotels::Create,
    ReindexMultisearchTable
end
