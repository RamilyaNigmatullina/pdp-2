class Users::FindOrCreateUser
  include Interactor

  TRANSLATE_SCOPE = %i[flash users authenticate].freeze

  delegate :auth_data, to: :context

  def call
    context.user = find_user || create_user
  rescue
    context.fail!(error: error_message)
  end

  private

  def find_user
    User.find_by(email: auth_data[:info][:email])
  end

  def create_user
    User.create(create_attributes)
  end

  def create_attributes
    {
      email: auth_data[:info][:email],
      full_name: auth_data[:info][:name],
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.zone.now
    }
  end

  def error_message
    I18n.t(:failure, scope: TRANSLATE_SCOPE, provider: auth_data[:provider])
  end
end
