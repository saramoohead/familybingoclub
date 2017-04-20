require "rails_helper"

describe Square do
  let!(:square) { described_class.create(code: "N001") }

  it "has a code relating to a number or picture" do
    expect(square.code).to eq "N001"
  end

  it "must have a unique code" do
    duplicated_square = described_class.create(code: "N001")
    expect(duplicated_square).not_to be_valid
  end

  it "is designated as uncalled if no called_timestamp exists" do
    expect(square.called?).to be false
  end

  it "is designated as called if passed a called_timestamp" do
    square.called_timestamp = "2017-04-20 22:14:50 +0100"
    expect(square.called?).to be true
  end
end
