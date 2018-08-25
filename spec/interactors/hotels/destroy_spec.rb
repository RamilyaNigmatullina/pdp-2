require "rails_helper"

describe Hotels::Destroy do
  subject(:context) { described_class.call(record: hotel) }

  let!(:hotel) { create :hotel }

  describe ".call" do
    it { is_expected.to be_success }

    it "destroys hotel" do
      expect { context }.to change { Hotel.count }.by(-1)
    end
  end
end
