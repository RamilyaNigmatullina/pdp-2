require "rails_helper"

describe HotelPolicy do
  let(:policy) { described_class.new(hotel, user: user) }
  let(:hotel) { create :hotel }
  let(:user) { create :user }

  describe "#index?" do
    subject { policy.apply(:index?) }

    it { is_expected.to eq true }

    context "when the user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to eq true }
    end
  end

  describe "#manage?" do
    subject { policy.apply(:manage?) }

    it { is_expected.to eq false }

    context "when the user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to eq true }
    end
  end
end
