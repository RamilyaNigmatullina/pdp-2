class Authenticate::FindOrCreateIdentity
  include Interactor

  delegate :decorated_auth_data, :user, :identity, to: :context
  delegate :provider, :uid, to: :decorated_auth_data

  def call
    context.identity = find_or_create_identity

    context.fail!(error: error) if identity.invalid?
  end

  private

  def find_or_create_identity
    user.identities.find_or_create_by(uid: uid, provider: provider)
  end

  def error
    identity.errors.full_messages.join(", ")
  end
end
