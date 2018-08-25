require "rails_helper"

feature "Sign Up with Google" do
  background do
    OmniAuth.config.mock_auth[:google_oauth2] = build :omniauth, :google
  end

  scenario "Visitor signs up with Google" do
    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Signed in successfully.")
  end
end
