module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    flash[:notice] = I18n.t(:not_authorized_error, scope: :pundit)

    redirect_to root_path
  end
end
