shared_context :stubbed_facebook_omniauth_data do |options|
  let(:uid) { options&.dig(:uid) || "1234567" }
  let(:email) { options&.dig(:email) || "user@example.com" }

  let(:omniauth) do
    build :omniauth, :facebook, uid: uid, email: email, name: "John Smith"
  end

  background do
    OmniAuth.config.mock_auth[:facebook] = omniauth
  end
end
