class Users::Authenticate
  include Interactor

  delegate :data, to: :context

  def call
    context.user = find_user || create_user
  end

  private

  def find_user
    User.find_by(email: data[:email])
  end

  def create_user
    User.create(create_attributes)
  end

  def create_attributes
    {
      email: data[:email],
      full_name: data[:name],
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.zone.now
    }
  end
end
