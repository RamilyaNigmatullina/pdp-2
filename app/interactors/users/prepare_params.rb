class Users::PrepareParams
  include Interactor

  delegate :authentication_hash, to: :context

  def call
    context.auth_data = auth_data

    context.fail!(error: error) if empty_fields.present?
  end

  private

  def auth_data
    @auth_data ||= {
      email: authentication_hash.dig(:info, :email),
      full_name: authentication_hash.dig(:info, :name),
      uid: authentication_hash.dig(:uid),
      provider: authentication_hash.dig(:provider)
    }
  end

  def empty_fields
    @empty_fields ||= begin
      fields = auth_data.map { |k, v| k if v.blank? }
      fields.compact.join(", ").titleize
    end
  end

  def error
    I18n.t(:invalid_data, scope: "interactors.users.authenticate", fields: empty_fields)
  end
end
