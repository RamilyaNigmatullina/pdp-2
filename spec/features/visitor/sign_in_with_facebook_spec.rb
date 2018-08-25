require "rails_helper"

feature "Sign In with Facebook" do
  let(:user) { create :user, email: "user@example.com" }

  background do
    create :identity, :facebook, user: user, uid: "1234567"

    OmniAuth.config.mock_auth[:facebook] = build :omniauth, :facebook, email: "user@example.com", uid: "1234567"
  end

  scenario "Visitor signs in with Facebook" do
    visit root_path

    click_on "Sign in with Facebook"

    expect(page).to have_content("Signed in successfully.")
  end
end
