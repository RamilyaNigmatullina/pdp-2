require "rails_helper"

feature "Create Hotel" do
  include_context :user_signed_in_as_admin
  include_context :stubbed_geolocation

  let(:hotel_attributes) do
    {
      name: "Hotel complex Tatarstan",
      address: "Pushkin str. 4, Kazan",
      longitude: "49.12240500000007",
      latitude: "55.786463",
      rating: "7.4",
      stars: "3",
      check_in_time: "22:00"
    }
  end

  background do
    create :city, name: "Kazan"
  end

  scenario "Admin creates hotel" do
    visit new_hotel_path

    fill_form(:hote, hotel_attributes)
    select "Kazan", from: "City"

    click_on "Create Hotel"

    expect(page).to have_content "Hotel was successfully created."
  end
end
