require "rails_helper"

describe Authenticate do
  let(:expected_interactors) do
    [
      Authenticate::PrepareParams,
      Authenticate::FindOrCreateUser,
      Authenticate::FindOrCreateIdentity
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
