module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      if authenticate_user.success?
        sign_in_and_redirect authenticate_user.user
      else
        redirect_to root_path, alert: authenticate_user.message
      end
    end

    private

    def authenticate_user
      @authenticate_user ||= Users::Authenticate.call(data: authentication_hash)
    end

    def authentication_hash
      request.env["omniauth.auth"].info
    end
  end
end
