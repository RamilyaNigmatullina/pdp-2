class Users::FindOrCreateUserAuthentication
  include Interactor

  TRANSLATE_SCOPE = %i[flash users authenticate].freeze

  delegate :auth_data, :user, to: :context
  delegate :user_authentications, to: :user

  def call
    find_or_create_user_authentication || context.fail!(error: error_message)
  end

  private

  def find_or_create_user_authentication
    user_authentications.where(uid: auth_data[:uid], provider: auth_data[:provider]).first_or_create
  end

  def error_message
    I18n.t(:failure, scope: TRANSLATE_SCOPE, provider: auth_data[:provider])
  end
end
