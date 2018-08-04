require "rails_helper"

describe Users::FindOrCreateUser do
  subject(:context) { described_class.call(auth_data: auth_data) }

  let(:auth_data) do
    {
      provider: "facebook",
      uid: "1234567",
      info: {
        email: "user@example.com",
        name: "Joe Bloggs"
      }
    }
  end

  describe "#call" do
    context "when user doesn't exist" do
      let(:expected_attributes) do
        {
          email: "user@example.com",
          full_name: "Joe Bloggs"
        }
      end

      it { is_expected.to be_success }

      it "creates user" do
        expect { context }.to change { User.count }.by(1)

        expect(context.user).to have_attributes(expected_attributes)
      end
    end

    context "when user exists" do
      let!(:user) { create :user, email: "user@example.com" }

      it { is_expected.to be_success }

      it "finds user by email" do
        expect { context }.not_to change { User.count }

        expect(context.user).to eq(user)
      end
    end

    context "when auth data is incorrect" do
      let(:error_message) { "You cannot be signed in with facebook. Please try again later." }
      let(:auth_data) do
        {
          provider: "facebook",
          uid: "1234567",
          email: "user@example.com",
          name: "Joe Bloggs"
        }
      end

      it { is_expected.to be_failure }

      it "provides error" do
        expect(context.error).to eq(error_message)
      end
    end
  end
end
