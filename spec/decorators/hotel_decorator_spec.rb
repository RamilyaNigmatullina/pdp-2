require "rails_helper"

describe HotelDecorator do
  let(:decorated_hotel) { hotel.decorate(context: { coordinates: coordinates }) }
  let(:hotel) { create :hotel, longitude: 49.12240500000007, latitude: 55.786463 }
  let(:coordinates) { [55.7679, 49.1631] }

  describe "#distance_text" do
    subject { decorated_hotel.distance_text }

    it { is_expected.to eq("3.3 km") }
  end
end
