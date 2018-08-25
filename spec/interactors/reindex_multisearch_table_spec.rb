require "rails_helper"

describe ReindexMultisearchTable do
  subject(:context) { described_class.call(record: hotel) }

  let(:hotel) { create :hotel }

  before { hotel.update(name: "New Name") }

  describe ".call" do
    it { is_expected.to be_success }

    it "rebuilds multisearch table" do
      expect(PgSearch::Multisearch).to receive(:rebuild).with(Hotel)

      context
    end

    context "when record was deleted" do
      before { hotel.destroy }

      it "rebuilds multisearch table" do
        expect(PgSearch::Multisearch).to receive(:rebuild).with(Hotel)

        context
      end
    end

    context "when searchable attributes were not changes" do
      before { hotel.update(latitude: 44.6437643) }

      it "doesn't rebuild multisearch table" do
        expect(PgSearch::Multisearch).not_to receive(:rebuild)

        context
      end
    end
  end
end
