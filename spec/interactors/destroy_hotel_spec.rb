require "rails_helper"

describe DestroyHotel do
  let(:expected_interactors) do
    [
      Hotels::Destroy,
      ReindexMultisearchTable
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
