require "rails_helper"

feature "Destroy Hotel" do
  include_context :user_signed_in_as_admin

  background do
    create :hotel, name: "Hotel complex Tatarstan", latitude: 55.78787607694294, longitude: 49.12356007675169
  end

  scenario "Admin destroys hotel" do
    visit hotels_path

    click_on "Delete"

    expect(page).to have_content "Hotel was successfully destroyed."
    expect(page).not_to have_content("Hotel complex Tatarstan")
  end
end
