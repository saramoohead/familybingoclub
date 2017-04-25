require "rails_helper"

describe Square do
  let!(:square) do
    create(
      :square,
      category: "N",
      description: "freespace",
      creator: "EOC",
      organisation: "STJOHNS",
      local_src: "free_space.jpg",
      number: 42,
      exclude: true
    )
  end

  it "has a category" do
    expect(square.category).to eq "N"
  end

  context "without a category" do
    let(:square_without_category) { build(:square, category: nil) }

    it "is not valid" do
      expect(square_without_category).not_to be_valid
    end
  end

  it "is designated as uncalled if no called_timestamp exists" do
    expect(square.called?).to be false
  end

  it "is designated as called if passed a called_timestamp" do
    square.called_timestamp = "2017-04-20 22:14:50 +0100"
    expect(square.called?).to be true
  end

  it "can have a description" do
    expect(square.description).to eq "freespace"
  end

  it "can have a creator" do
    expect(square.creator).to eq "EOC"
  end

  it "can have a local src" do
    expect(square.local_src).to eq "free_space.jpg"
  end

  # TODO: replaced with a model association
  it "can have an organisation" do
    expect(square.organisation).to eq "STJOHNS"
  end

  it "can have a number for display" do
    expect(square.number).to eq 42
  end

  it "can have an exclude value of true" do
    expect(square.exclude).to be true
  end

  context "without an exclude value" do
    let(:nil_square) { create(:square, exclude: nil) }

    it "defaults to a value of true" do
      expect(nil_square.exclude).to be true
    end
  end

  it { is_expected.to have_and_belong_to_many(:boards) }

  # TODO: validate timestamp
end
