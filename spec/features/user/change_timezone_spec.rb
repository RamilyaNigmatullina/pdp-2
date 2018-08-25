require "rails_helper"

feature "Change Timezone" do
  include_context :time_is_frozen
  include_context :user_signed_in

  scenario "User changes his timezone" do
    visit root_path

    expect(page).to have_content("Current Time 14:00")

    visit edit_user_registration_path(current_user)

    select "Paris", from: "Timezone"
    click_on "Update"

    expect(page).to have_content("Current Time 13:00")
  end
end
