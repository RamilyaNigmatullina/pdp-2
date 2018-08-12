require "rails_helper"

feature "Create Hotel" do
  include_context :user_signed_in_as_admin

  before { create :city, name: "Kazan" }

  scenario "User creates hotel" do
    visit new_hotel_path

    fill_in "Name", with: "Hotel complex Tatarstan"
    fill_in "Address", with: "Pushkin str. 4, Kazan"
    fill_in "Longitude", with: "49.12240500000007"
    fill_in "Latitude", with: "55.786463"
    fill_in "Rating", with: "7.4"
    fill_in "Stars", with: "3"
    select "Kazan", from: "City"

    click_on "Create Hotel"

    expect(page).to have_content "Hotel was successfully created."

    expect(page).to have_content("Hotel complex Tatarstan")
    expect(page).to have_content("Address: Pushkin str. 4, Kazan")
    expect(page).to have_content("Stars: 3")
    expect(page).to have_content("Rating: 7.4")
    expect(page).to have_content("Distance: 3 км.")
  end
end
