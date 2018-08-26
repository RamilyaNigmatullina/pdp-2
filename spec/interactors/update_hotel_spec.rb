require "rails_helper"

describe UpdateHotel do
  let(:expected_interactors) do
    [
      Hotels::Update,
      ReindexMultisearchTable
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
