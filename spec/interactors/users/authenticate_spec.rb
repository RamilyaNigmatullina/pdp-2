require "rails_helper"

describe Users::Authenticate do
  let(:expected_interactors) do
    [
      Users::FindOrCreateUser,
      Users::FindOrCreateUserAuthentication
    ]
  end

  describe "#organized" do
    it "organizes other interactors" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
