require "rails_helper"

feature "Sign In" do
  let(:user) { create :user }
  let(:unconfirmed_user) { create :user, :not_confirmed }
  let(:facebook_auth_hash) do
    build :authentication_hash, provider: "facebook", uid: "1234567",
      email: "user@example.com", name: "John Smith"
  end
  let(:google_auth_hash) do
    build :authentication_hash, provider: "google_oauth2", uid: "1234567",
      email: "user@example.com", name: "John Smith"
  end
  let(:current_user) { User.last }

  before do
    OmniAuth.configure do |config|
      config.mock_auth[:facebook] = facebook_auth_hash
      config.mock_auth[:google_oauth2] = google_auth_hash
    end
  end

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Sign out")
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end

  scenario "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content("You have to confirm your email address before continuing.")
  end

  scenario "User signs in with Facebook" do
    visit root_path

    click_on "Sign in with Facebook"

    expect(page).to have_content("Sign out")

    visit edit_user_registration_path(current_user)

    expect(page).to have_field("Full name", with: "John Smith")
    expect(page).to have_field("Email", with: "user@example.com")
  end

  scenario "User signs in with Google" do
    visit root_path

    click_on "Sign in with Google"

    expect(page).to have_content("Sign out")

    visit edit_user_registration_path(current_user)

    expect(page).to have_field("Full name", with: "John Smith")
    expect(page).to have_field("Email", with: "user@example.com")
  end
end
