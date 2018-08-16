class Users::FindOrCreateUser
  include Interactor

  delegate :auth_data, :user, to: :context

  def call
    context.user = find_user || create_user

    context.fail!(error: error) if user.new_record?
  end

  def rollback
    user.destroy if context.new_user
  end

  private

  def find_user
    find_by_email || find_by_uid_and_provider
  end

  def find_by_email
    User.find_by(email: auth_data[:email])
  end

  def find_by_uid_and_provider
    Identity.find_by(provider: auth_data[:provider], uid: auth_data[:uid])&.user
  end

  def create_user
    context.new_user = true

    User.create(create_attributes)
  end

  def create_attributes
    {
      email: auth_data[:email],
      full_name: auth_data[:full_name],
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.zone.now
    }
  end

  def error
    user.errors.full_messages.join(", ")
  end
end
