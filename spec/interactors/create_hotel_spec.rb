require "rails_helper"

describe CreateHotel do
  let(:expected_interactors) do
    [
      Hotels::Save,
      ReindexMultisearchTable
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
