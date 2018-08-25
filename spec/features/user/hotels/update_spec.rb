require "rails_helper"

feature "Update Hotel" do
  include_context :user_signed_in_as_admin
  include_context :stubbed_geolocation

  let(:hotel) do
    create :hotel,
      name: "Hotel Nogai",
      address: "Profsoyuznaya str. 16B, Kazan",
      longitude: 49.11462860000006,
      latitude: 55.7919311,
      rating: 9.1,
      stars: 3
  end
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

  scenario "Admin updates hotel" do
    visit edit_hotel_path(hotel)

    fill_form(:hote, hotel_attributes)

    click_on "Update Hotel"

    expect(page).to have_content "Hotel was successfully updated."
  end
end
