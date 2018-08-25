shared_context :stubbed_google_omniauth_data do |options|
  let(:uid) { options&.dig(:uid) || "1234567" }
  let(:email) { options&.dig(:email) || "user@example.com" }

  let(:omniauth) do
    build :omniauth, :google, uid: uid, email: email, name: "John Smith"
  end

  background do
    OmniAuth.config.mock_auth[:google_oauth2] = omniauth
  end
end
