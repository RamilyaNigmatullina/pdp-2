require "rails_helper"

feature "List Hotels" do
  background do
    stub_geocoder "127.0.0.1", coordinates: [55.7887, 49.1221]
    create :hotel, name: "Hotel complex Tatarstan", latitude: 55.786463, longitude: 49.122405
  end

  scenario "Visitor sees list of hotels" do
    visit hotels_path

    expect(page).to have_content("Hotel complex Tatarstan")
    expect(page).to have_content("Distance: 0.2 km")
  end
end
