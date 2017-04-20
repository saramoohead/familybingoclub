require "rails_helper"

describe Square do
  let(:square) { described_class.new(code: "N001") }

  it "has a code relating to a number or picture" do
    expect(square.code).to eq "N001"
  end

  xit "must have a unique code" do
    duplicated_square = described_class.new(code: "N001")
    expect(duplicated_square).not_to be_valid
  end

  xit "can be designated as called if passed a called_timestamp" do
  end
end
