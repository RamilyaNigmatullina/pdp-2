module Authorization
  extend ActiveSupport::Concern

  included do
    verify_authorized unless: :devise_controller?

    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized
  end

  private

  def user_not_authorized
    flash[:notice] = I18n.t(:unauthorized_error, scope: :action_policy)

    redirect_to root_path
  end

  def policy_for(record:, **opts)
    record = record.model if record.is_a?(Draper::Decorator)

    super(record: record, **opts)
  end
end
