require "rails_helper"

describe Board do
  let!(:board) { create(:board, code: "B00001", category: "N") }
  let(:square) { create(:square) }

  it "has a board code" do
    expect(board.code).to eq "B00001"
  end

  it "has a unique board code" do
    duplicated_board = build(:board, code: "B00001")
    expect(duplicated_board).not_to be_valid
  end

  it "can have a board category" do
    expect(board.category).to eq "N"
  end

  it "must have a board category" do
    board_without_category = build(:board, code: "B00002")
    expect(board_without_category).not_to be_valid
  end

  # http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
  # For example, if your application includes (boards) and (squares),
  # with each (board) having many (squares) and each (square)
  # appearing in many (boards), you could declare the models as a has_and_belongs_to_many.
  it { is_expected.to have_and_belong_to_many(:squares) }

  it "is created with 25 squares associated" do
    expect(board.squares.count).to eq 25
  end

  it "can only contain squares of the board category" do
    expect(board.squares.map(&:category)).to all eq "N"
  end

  # I can't figure out how to test this
  xit "can only contain a square once" do
    board.squares << square
    expect(board.squares << square).to raise_error
  end

  it "must have an array of five arrays" do
    expect(board.validated_picture_board.count).to eq(5)
  end

  it "has a middle square called FREE SPACE" do
    middle_square = Square.find(board.validated_picture_board[2][2])
    expect(middle_square[0].description).to eq "freespace"
  end

  xit "can ask Game if it is a winner" do
  end

  xcontext "when it is a number category" do
    it "only allows appropriate numbers in appropriate columns" do
    end
  end

end


