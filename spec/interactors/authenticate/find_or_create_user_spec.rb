require "rails_helper"

describe Authenticate::FindOrCreateUser do
  subject(:context) { described_class.call(decorated_auth_data: decorated_auth_data) }

  let(:decorated_auth_data) { AuthDataDecorator.new(auth_data) }
  let(:auth_data) do
    build :omniauth, :facebook, uid: "1234567", email: "user@example.com", name: "John Smith"
  end
  let(:expected_attributes) do
    {
      email: "user@example.com",
      full_name: "John Smith"
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
    end

    context "when user changed his email" do
      let(:user) { create :user, email: "new_email@example.com" }

      before { create :identity, :facebook, user: user, uid: "1234567" }

      it { is_expected.to be_success }

      it "finds user by email" do
        expect { context }.not_to change(User, :count)

        expect(context.user).to eq(user)
      end
    end

    context "when auth data is incorrect" do
      let(:auth_data) do
        build :omniauth, :facebook, uid: "1234567", email: "invalid email", name: "John Smith"
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
      expect { context }.not_to(change { User.count })
    end

    context "when user wasn't created" do
      before { create :user, email: "user@example.com" }

      it "doesn't destroy user" do
        expect { context }.not_to(change { User.count })
      end
    end
  end
end
