require "rails_helper"

feature "Sign Up with Facebook" do
  background do
    OmniAuth.config.mock_auth[:facebook] = build :omniauth, :facebook
  end

  scenario "Visitor signs up with Facebook" do
    visit root_path

    click_on "Sign in with Facebook"

    expect(page).to have_content("Signed in successfully.")
  end
end
