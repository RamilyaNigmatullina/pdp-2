require "rails_helper"

describe DistanceCalculator do
  subject(:distance_calculator) { described_class.new(initial_params) }

  let(:initial_params) do
    {
      coordinates_1: kfu,
      coordinates_2: korston,
      measure: measure
    }
  end
  let(:kfu) { [55.79222461, 49.12196138] }
  let(:korston) { [55.79385051, 49.14958698] }

  describe "#distance" do
    subject { distance_calculator.distance }

    context "when measure is km" do
      let(:measure) { :km }

      it { is_expected.to eq(1.736369088304447) }
    end

    context "when measure is m" do
      let(:measure) { :m }

      it { is_expected.to eq(1736.369088304447) }
    end

    context "when measure is invalid" do
      let(:measure) { :mm }

      it { is_expected.to eq("Measure is not included in the list: m, km") }
    end
  end
end
