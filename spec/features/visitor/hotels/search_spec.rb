require "rails_helper"

feature "Search Hotels" do
  include_context :stubbed_geolocation

  background do
    create :hotel,
      name: "Hotel complex Tatarstan",
      address: "Pushkin str. 4, Kazan",
      longitude: 49.12240500000007,
      latitude: 55.786463,
      rating: 7.4,
      stars: 3

    create :hotel,
      name: "Hotel Nogai",
      address: "Profsoyuznaya str. 16B, Kazan",
      longitude: 49.11462860000006,
      latitude: 55.7919311,
      rating: 9.1,
      stars: 3
  end

  scenario "Visitor searches hotels" do
    visit hotels_path

    fill_in "Search", with: "Hotel complex Tatarstan"
    fill_in "Min Rating", with: "7"
    fill_in "Max Rating", with: "8"
    fill_in "Stars Amount", with: "3"
    fill_in "Radius, km.", with: "3.7"

    click_on "Find"

    expect(page).to have_content("Hotel complex Tatarstan")
    expect(page).not_to have_content("Hotel Nogai")
  end
end
