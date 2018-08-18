class Users::Authenticate
  include Interactor::Organizer

  organize Users::PrepareParams,
    Users::FindOrCreateUser,
    Users::FindOrCreateIdentity
end
