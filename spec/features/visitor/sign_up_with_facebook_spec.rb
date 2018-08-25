require "rails_helper"

feature "Sign Up with Facebook" do
  include_context :stubbed_facebook_omniauth_data

  scenario "Visitor signs up with Facebook" do
    visit root_path

    click_on "Sign in with Facebook"

    expect(page).to have_content("Signed in successfully.")
  end
end
