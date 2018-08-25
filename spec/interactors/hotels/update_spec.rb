require "rails_helper"

describe Hotels::Update do
  subject(:context) { described_class.call(record: hotel, record_params: hotel_params) }

  let(:hotel) { create :hotel, name: "Hotel Nogai", address: "Profsoyuznaya str. 16B, Kazan" }
  let(:hotel_params) { ActionController::Parameters.new(hotel_attributes) }
  let(:hotel_attributes) { { name: "Hotel complex Tatarstan" } }

  describe ".call" do
    it "updates hotel" do
      is_expected.to be_success

      expect(hotel.reload).to have_attributes(name: "Hotel complex Tatarstan")
    end

    context "when hotel params are invalid" do
      let(:hotel_attributes) { { name: "" } }

      it "doesn't update hotel" do
        is_expected.to be_failure

        expect(hotel.reload).to have_attributes(name: "Hotel Nogai")
      end
    end
  end
end
