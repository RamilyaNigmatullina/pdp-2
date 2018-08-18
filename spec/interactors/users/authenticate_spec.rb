require "rails_helper"

describe Users::Authenticate do
  let(:expected_interactors) do
    [
      Users::PrepareParams,
      Users::FindOrCreateUser,
      Users::FindOrCreateIdentity
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
