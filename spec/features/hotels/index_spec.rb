require "rails_helper"

feature "List Articles" do
  include_context :stubbed_geolocation

  let!(:first_hotel) do
    create :hotel, name: "Hotel complex Tatarstan", address: "Pushkin str. 4, Kazan",
                   longitude: 49.12240500000007, latitude: 55.786463, rating: 7.4, stars: 3
  end
  let!(:second_hotel) do
    create :hotel, name: "Hotel Nogai", address: "Profsoyuznaya str. 16B, Kazan",
                   longitude: 49.11462860000006, latitude: 55.7919311, rating: 9.1, stars: 3
  end

  let(:hotel_selector) { ".hotel-item" }
  let(:first_hotel_selector) { ".hotel-item[data-id='#{first_hotel.id}']" }
  let(:second_hotel_selector) { ".hotel-item[data-id='#{second_hotel.id}']" }

  scenario "Visitor sees list of hotels" do
    visit hotels_path

    expect(page).to have_content("Hotels")
    expect(page).to have_selector(hotel_selector, count: 2)

    within first_hotel_selector do
      expect(page).to have_content("Hotel complex Tatarstan")
      expect(page).to have_content("Address: Pushkin str. 4, Kazan")
      expect(page).to have_content("Stars: 3")
      expect(page).to have_content("Rating: 7.4")
      expect(page).to have_content("Check-in time: 17:00")
      expect(page).to have_content("Distance: 0.2 km")
    end

    within second_hotel_selector do
      expect(page).to have_content("Hotel Nogai")
      expect(page).to have_content("Address: Profsoyuznaya str. 16B, Kazan")
      expect(page).to have_content("Stars: 3")
      expect(page).to have_content("Rating: 9.1")
      expect(page).to have_content("Check-in time: 17:00")
      expect(page).to have_content("Distance: 0.6 km")
    end
  end

  scenario "User searches hotels" do
    visit hotels_path

    fill_in "Search", with: "Hotel complex Tatarstan"
    fill_in "Min Rating", with: "7"
    fill_in "Max Rating", with: "8"
    fill_in "Stars Amount", with: "3"
    fill_in "Radius, km.", with: "3.7"

    click_on "Find"

    expect(page).to have_selector(hotel_selector, count: 1)

    within first_hotel_selector do
      expect(page).to have_content("Hotel complex Tatarstan")
      expect(page).to have_content("Address: Pushkin str. 4, Kazan")
      expect(page).to have_content("Stars: 3")
      expect(page).to have_content("Rating: 7.4")
      expect(page).to have_content("Distance: 0.2 km")
    end
  end
end
