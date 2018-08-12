require "rails_helper"

feature "Destroy Hotel" do
  include_context :user_signed_in_as_admin

  before { create :hotel, name: "Hotel complex Tatarstan" }

  scenario "User destroys hotel" do
    visit hotels_path

    click_on "Delete"

    expect(page).to have_content "Hotel was successfully destroyed."
    expect(page).not_to have_content("Hotel complex Tatarstan")
  end
end
