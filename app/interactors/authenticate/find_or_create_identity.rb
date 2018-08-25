class Authenticate::FindOrCreateIdentity
  include Interactor

  delegate :auth_data, :user, :identity, to: :context

  def call
    context.identity = find_or_create_identity

    context.fail!(error: error) if identity.invalid?
  end

  private

  def find_or_create_identity
    user.identities.find_or_create_by(uid: auth_data[:uid], provider: auth_data[:provider])
  end

  def error
    identity.errors.full_messages.join(", ")
  end
end
