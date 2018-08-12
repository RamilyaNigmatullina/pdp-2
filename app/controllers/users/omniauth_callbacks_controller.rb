class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authenticate
  end

  def google_oauth2
    authenticate
  end

  def failure
    redirect_to root_path
  end

  private

  def authenticate
    if authenticate_user.success?
      sign_in_and_redirect authenticate_user.user, event: :authentication
    else
      redirect_to root_path, alert: authenticate_user.error
    end
  end

  def authenticate_user
    @authenticate_user ||= Users::Authenticate.call(authentication_hash: authentication_hash)
  end

  def authentication_hash
    request.env["omniauth.auth"]
  end
end
