require "rails_helper"

describe Users::FindOrCreateUser do
  subject(:context) { described_class.call(auth_data: auth_data) }

  let(:auth_data) do
    {
      provider: "facebook",
      uid: "1234567",
      email: "user@example.com",
      full_name: "Joe Bloggs"
    }
  end
  let(:expected_attributes) do
    {
      email: "user@example.com",
      full_name: "Joe Bloggs"
    }
  end

  describe ".call" do
    it { is_expected.to be_success }

    it "creates user" do
      expect { context }.to change { User.count }.by(1)

      expect(context.user).to have_attributes(expected_attributes)
    end

    context "when user exists" do
      let!(:user) { create :user, email: "user@example.com" }

      it { is_expected.to be_success }

      it "finds user by email" do
        expect { context }.not_to change(User, :count)

        expect(context.user).to eq(user)
      end

      context "when user changed his email" do
        let(:user) { create :user, email: "new_email@example.com" }

        before { create :identity, user: user, provider: "facebook", uid: "1234567" }

        it { is_expected.to be_success }

        it "finds user by email" do
          expect { context }.not_to change(User, :count)

          expect(context.user).to eq(user)
        end
      end
    end

    context "when auth data is incorrect" do
      let(:auth_data) do
        {
          provider: "facebook",
          uid: "1234567",
          email: "invalid email",
          full_name: "Joe Bloggs"
        }
      end

      it "provides error" do
        is_expected.to be_failure

        expect(context.error).to eq("Email is invalid")
      end
    end
  end

  describe ".rollback" do
    subject(:context) { described_class.new(auth_data: auth_data).rollback }

    it "destroys created user" do
      expect { subject }.not_to change { User.count }
    end

    context "when user wasn't created" do
      let!(:user) { create :user, email: "user@example.com" }

      it "doesn't destroy user" do
        expect { subject }.not_to change { User.count }
      end
    end
  end
end
