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

  describe "#call" do
    it "prepares auth_data" do
      is_expected.to be_success

      expect(context.auth_data).to eq(expected_auth_data)
    end

    context "when auth data is incorrect" do
      let(:error_message) { "Your data is invalid. Please try again later." }
      let(:authentication_hash) do
        build :authentication_hash, provider: "facebook", uid: "1234567", email: "", name: ""
      end

      it "provides error" do
        is_expected.to be_failure

        expect(context.error).to eq(error_message)
      end
    end
  end
end
