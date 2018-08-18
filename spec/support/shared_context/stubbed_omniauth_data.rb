shared_context :stubbed_omniauth_data do
  let(:facebook_auth_hash) do
    build :authentication_hash, provider: "facebook", uid: "1234567", email: "user@example.com", name: "John Smith"
  end
  let(:google_auth_hash) do
    build :authentication_hash, provider: "google_oauth2", uid: "1234567", email: "user@example.com", name: "John Smith"
  end

  before do
    OmniAuth.configure do |config|
      config.mock_auth[:facebook] = facebook_auth_hash
      config.mock_auth[:google_oauth2] = google_auth_hash
    end
  end
end
