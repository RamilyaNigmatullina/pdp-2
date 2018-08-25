require "rails_helper"

feature "Sign Up with Google" do
  include_context :stubbed_google_omniauth_data

  scenario "Visitor signs up with Google" do
    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Signed in successfully.")
  end
end
