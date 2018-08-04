class Users::FindOrCreateUserAuthentication
  include Interactor

  delegate :auth_data, :user, to: :context
  delegate :user_authentications, to: :user

  def call
    context.user_authentication = user_authentication
  end

  private

  def user_authentication
    user_authentications.find_or_create_by(uid: auth_data[:uid], provider: auth_data[:provider])
  end
end
