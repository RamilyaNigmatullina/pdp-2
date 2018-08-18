require "rails_helper"

describe FilteredHotels do
  subject(:query) { described_class.new(Hotel.all, filter_params).all }

  let(:city_1) { create :city, name: "Kazan" }
  let(:city_2) { create :city, name: "Moscow" }
  let!(:hotel_1) do
    create :hotel, city: city_1, name: "Hotel Korston Tower", address: "Kazan city, N. Ershova str., 1А",
                   longitude: 49.14956600000005, latitude: 55.793874, rating: 8.7, stars: 4
  end
  let!(:hotel_2) do
    create :hotel, city: city_2, name: "AZIMUT Hotel Olympic Moscow", address: "Moscow city, Olympic avenue, 18/1",
                   longitude: 37.62303159999999, latitude: 55.7853487, rating: 9.2, stars: 3
  end

  let(:filter_params) { {} }

  it { is_expected.to match_array([hotel_1, hotel_2]) }

  describe "#by_search" do
    context "with hotel name provided as keyword" do
      let(:filter_params) { { search: "AZIMUT Hotel Olympic Moscow" } }

      it { is_expected.to match_array([hotel_2]) }
    end
  end

  describe "#by_stars" do
    context "with stars amount" do
      let(:filter_params) { { stars: 4 } }

      it { is_expected.to match_array(hotel_1) }
    end
  end

  describe "#by_min_rating" do
    context "with min rating" do
      let(:filter_params) { { min_rating: 9 } }

      it { is_expected.to match_array([hotel_2]) }
    end
  end

  describe "#by_max_rating" do
    context "with min rating" do
      let(:filter_params) { { max_rating: 9 } }

      it { is_expected.to match_array([hotel_1]) }
    end
  end

  describe "#by_near" do
    context "with radius param and valid coordinates" do
      let(:filter_params) do
        {
          near: {
            radius: 5,
            coordinates: [55.7679, 49.1631]
          }
        }
      end

      it { is_expected.to match_array([hotel_1]) }
    end

    context "with radius param and invalid coordinates" do
      let(:filter_params) do
        {
          near: {
            radius: 5,
            coordinates: ["", nil]
          }
        }
      end

      it { is_expected.to match_array([hotel_1, hotel_2]) }
    end
  end
end
