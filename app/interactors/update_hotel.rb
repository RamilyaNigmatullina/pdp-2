class UpdateHotel
  include Interactor::Organizer

  organize Hotels::Update,
    ReindexMultisearchTable
end
