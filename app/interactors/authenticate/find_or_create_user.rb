class Authenticate::FindOrCreateUser
  include Interactor

  delegate :decorated_auth_data, :user, to: :context
  delegate :email, :name, :provider, :uid, to: :decorated_auth_data

  def call
    context.user = find_user || create_user

    context.fail!(error: error) if user.invalid?
  end

  def rollback
    user.destroy if context.new_user
  end

  private

  def find_user
    by_email || by_uid_and_provider
  end

  def by_email
    User.find_by(email: email)
  end

  def by_uid_and_provider
    Identity.find_by(provider: provider, uid: uid)&.user
  end

  def create_user
    context.new_user = true

    User.create(create_attributes)
  end

  def create_attributes
    {
      email: email,
      full_name: name,
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.current
    }
  end

  def error
    user.errors.full_messages.join(", ")
  end
end
