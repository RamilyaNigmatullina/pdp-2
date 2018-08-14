require "rails_helper"

describe HotelDecorator do
  let(:current_coordinates) { [55.7679, 49.1631] }
  let(:geocoded_hotel) { Hotel.near(current_coordinates).find(hotel.id) }
  let(:hotel) { create :hotel, longitude: 49.12240500000007, latitude: 55.786463 }

  describe "#distance_text" do
    subject { geocoded_hotel.decorate.distance_text }

    it { is_expected.to eq("3.3 km") }
  end
end
