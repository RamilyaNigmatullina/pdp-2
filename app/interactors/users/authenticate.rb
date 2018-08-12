class Users::Authenticate
  include Interactor::Organizer

  organize Users::PrepareParams,
    Users::FindOrCreateUser,
    Users::FindOrCreateUserAuthentication
end
