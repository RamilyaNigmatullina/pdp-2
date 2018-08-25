require "rails_helper"

feature "Sign In with Google" do
  let(:user) { create :user, email: "user@example.com" }

  background do
    create :identity, :facebook, user: user, uid: "1234567"

    OmniAuth.config.mock_auth[:google_oauth2] = build :omniauth, :google, email: "user@example.com", uid: "1234567"
  end

  scenario "Visitor signs in with Google" do
    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Signed in successfully.")
  end
end
