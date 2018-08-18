require "rails_helper"

describe Users::FindOrCreateIdentity do
  subject(:context) { described_class.call(auth_data: auth_data, user: user) }

  let(:user) { create :user }
  let(:auth_data) do
    {
      provider: "facebook",
      uid: "1234567"
    }
  end
  let(:expected_attributes) do
    {
      provider: "facebook",
      uid: "1234567",
      user_id: user.id
    }
  end

  describe ".call" do
    it { is_expected.to be_success }

    it "creates identity" do
      expect { context }.to change { Identity.count }.by(1)

      expect(Identity.last).to have_attributes(expected_attributes)
    end

    context "when user has identity" do
      before { create :identity, :facebook, user: user, uid: "1234567" }

      it { is_expected.to be_success }

      it "doesn't create identity" do
        expect { context }.not_to change(Identity, :count)
      end
    end

    context "when user has identity for another provider" do
      before { create :identity, :google, user: user }

      it { is_expected.to be_success }

      it "creates identity" do
        expect { context }.to change { Identity.count }.by(1)

        expect(Identity.last).to have_attributes(expected_attributes)
      end
    end
  end
end
