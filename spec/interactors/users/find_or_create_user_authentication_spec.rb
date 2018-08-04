require "rails_helper"

describe Users::FindOrCreateUserAuthentication do
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

  describe "#call" do
    context "when user doesn't have user authentication" do
      let(:user_authentication) { UserAuthentication.last }

      it { is_expected.to be_success }

      it "creates user authentication" do
        expect { context }.to change { UserAuthentication.count }.by(1)

        expect(user_authentication).to have_attributes(expected_attributes)
      end
    end

    context "when user has user authentication for another provider" do
      before { create :user_authentication, user: user, provider: "google_oauth2" }

      it { is_expected.to be_success }

      it "creates user authentication" do
        expect { context }.to change { UserAuthentication.count }.by(1)

        expect(UserAuthentication.last).to have_attributes(expected_attributes)
      end
    end

    context "when user has user authentication" do
      before { create :user_authentication, user: user, provider: "facebook", uid: "1234567" }

      it { is_expected.to be_success }

      it "doesn't create user authentication" do
        expect { context }.not_to change { UserAuthentication.count }
      end
    end
  end
end
