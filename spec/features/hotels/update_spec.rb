require "rails_helper"

feature "Update Hotel" do
  include_context :user_signed_in_as_admin

  let(:hotel) do
    create :hotel, name: "Hotel Nogai", address: "Profsoyuznaya str. 16B, Kazan",
                   longitude: 49.11462860000006, latitude: 55.7919311, rating: 9.1, stars: 3
  end

  scenario "User updates hotel" do
    visit edit_hotel_path(hotel)

    fill_in "Name", with: "Hotel complex Tatarstan"
    fill_in "Address", with: "Pushkin str. 4, Kazan"
    fill_in "Longitude", with: "49.12240500000007"
    fill_in "Latitude", with: "55.786463"
    fill_in "Rating", with: "7.4"
    fill_in "Check in time", with: "22:00"
    fill_in "Stars", with: "3"

    click_on "Update Hotel"

    expect(page).to have_content "Hotel was successfully updated."

    expect(page).to have_content("Hotel complex Tatarstan")
    expect(page).to have_content("Address: Pushkin str. 4, Kazan")
    expect(page).to have_content("Stars: 3")
    expect(page).to have_content("Rating: 7.4")
    expect(page).to have_content("Check-in time: 22:00")
    expect(page).to have_content("Distance: 3.3 km")
  end
end
