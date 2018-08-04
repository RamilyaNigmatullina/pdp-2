class Users::Authenticate
  include Interactor::Organizer

  organize Users::FindOrCreateUser,
    Users::FindOrCreateUserAuthentication
end
