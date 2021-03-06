require "rails_helper"

feature "Sign In with Google" do
  include_context :stubbed_google_omniauth_data, email: "user@example.com", uid: "1234567"

  let(:user) { create :user, email: "user@example.com" }

  background do
    create :identity, :facebook, user: user, uid: "1234567"
  end

  scenario "Visitor signs in with Google" do
    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Signed in successfully.")
  end
end
