require "rails_helper"

describe Hotels::Save do
  subject(:context) { described_class.call(record: hotel) }

  let(:hotel) { build :hotel }

  describe ".call" do
    it { is_expected.to be_success }

    it "saves hotel" do
      expect { context }.to change { Hotel.count }.by(1)
    end

    context "when hotel is invalid" do
      let(:hotel) { build :hotel, name: "" }

      it { is_expected.to be_failure }

      it "doesn't save hotel" do
        expect { context }.not_to(change { Hotel.count })
      end
    end
  end
end
