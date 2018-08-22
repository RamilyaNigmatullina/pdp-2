class Authenticate
  include Interactor::Organizer

  organize Authenticate::PrepareParams,
    Authenticate::FindOrCreateUser,
    Authenticate::FindOrCreateIdentity
end
