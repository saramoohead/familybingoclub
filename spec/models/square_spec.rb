require "spec_helper"

describe Square do
  it "is a code relating to a number or picture" do
    Sqaure.new(code: "N001")
    expect(square.code).to eq "N001"
  end

  it "knows if it has been called or not" do
  end
end
