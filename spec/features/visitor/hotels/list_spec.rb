require "rails_helper"

feature "List Hotels" do
  include_context :stubbed_geolocation

  let!(:hotel) do
    create :hotel,
      name: "Hotel complex Tatarstan",
      address: "Pushkin str. 4, Kazan",
      longitude: 49.12240500000007,
      latitude: 55.786463,
      rating: 7.4,
      stars: 3
  end

  let(:hotel_selector) { find(".hotel-item[data-id='#{hotel.id}']") }

  scenario "Visitor sees list of hotels" do
    visit hotels_path

    expect(hotel_selector).to have_content("Hotel complex Tatarstan")
    expect(hotel_selector).to have_content("Address: Pushkin str. 4, Kazan")
    expect(hotel_selector).to have_content("Stars: 3")
    expect(hotel_selector).to have_content("Rating: 7.4")
    expect(hotel_selector).to have_content("Check-in time: 17:00")
    expect(hotel_selector).to have_content("Distance: 0.2 km")
  end
end
