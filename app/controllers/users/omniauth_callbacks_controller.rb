module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      bar
    end

    def google_oauth2
      bar
    end

    def failure
      redirect_to root_path
    end

    private

    def bar
      if authenticate_user.success?
        sign_in_and_redirect authenticate_user.user, event: :authentication
      else
        redirect_to root_path, alert: authenticate_user.message
      end
    end

    def authenticate_user
      @authenticate_user ||= Users::Authenticate.call(auth_data: facebook_auth_data)
    end

    def authentication_hash
      request.env["omniauth.auth"]
    end
  end
end
