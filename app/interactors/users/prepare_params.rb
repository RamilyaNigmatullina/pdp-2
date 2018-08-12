class Users::PrepareParams
  include Interactor

  TRANSLATE_SCOPE = %i[flash users authenticate].freeze

  delegate :authentication_hash, to: :context

  def call
    context.auth_data = auth_data

    context.fail!(error: error_message) if auth_data_invalid?
  end

  private

  def auth_data
    @auth_data ||= {
      email: authentication_hash[:info][:email],
      full_name: authentication_hash[:info][:name],
      uid: authentication_hash[:uid],
      provider: authentication_hash[:provider]
    }
  end

  def auth_data_invalid?
    !auth_data.map { |_k, v| v.present? }.all?
  end

  def error_message
    I18n.t(:invalid_data, scope: TRANSLATE_SCOPE)
  end
end
