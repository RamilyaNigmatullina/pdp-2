require "rails_helper"

describe Users::PrepareParams do
  subject(:context) { described_class.call(authentication_hash: authentication_hash) }

  let(:authentication_hash) do
    build :authentication_hash, provider: "facebook", uid: "1234567", email: "user@example.com", name: "John Smith"
  end
  let(:expected_auth_data) do
    {
      provider: "facebook",
      uid: "1234567",
      email: "user@example.com",
      full_name: "John Smith"
    }
  end

  describe ".call" do
    it "prepares auth_data" do
      is_expected.to be_success

      expect(context.auth_data).to eq(expected_auth_data)
    end

    context "when auth data is incorrect" do
      let(:authentication_hash) do
        build :authentication_hash, provider: "facebook", uid: "1234567", email: "", name: nil
      end

      it "provides error" do
        is_expected.to be_failure

        expect(context.error).to eq("Email, Full Name should be present. Please try again.")
      end
    end
  end
end
