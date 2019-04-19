require "rails_helper"

feature "Show Hotel" do
  let(:hotel) do
    create :hotel, name: "Hotel complex Tatarstan", latitude: 55.78787607694294, longitude: 49.12356007675169
  end

  scenario "User sees hotel page" do
    visit hotel_path(hotel)

    expect(page).to have_content("Hotel complex Tatarstan")
  end
end
