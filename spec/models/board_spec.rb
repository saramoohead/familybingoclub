require "rails_helper"

describe Board do
  let!(:board) { create(:board, code: "B00001", type: "N") }

  it "has a board code" do
    expect(board.code).to eq "B00001"
  end

  it "has a unique board code" do
    duplicated_board = build(:board, code: "B00001")
    expect(duplicated_board).not_to be_valid
  end

  it "can have a board type" do
    expect(board.type).to eq "N"
  end

  it "must have a board type" do
    board_without_type = build(:board, code: "B00002")
    expect(board_without_type).not_to be_valid
  end

  # http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
  # For example, if your application includes (boards) and (squares),
  # with each (board) having many (squares) and each (square)
  # appearing in many (boards), you could declare the models as a has_and_belongs_to_many.
  it { is_expected.to have_and_belong_to_many(:squares) }

  xit "must be an array of five arrays, each with five square ids" do
    expect(board.board_square_ids).to eq(
      [
        [1, 16, 31, 46, 61],
        [2, 17, 32, 47, 62],
        [3, 18, 0, 48, 63],
        [4, 19, 34, 49, 64],
        [5, 20, 35, 50, 65]
      ]
    )
  end

  xit "can only contain squares of one type" do
  end

  xcontext "when it is a number type" do
    it "only allows appropriate numbers in appropriate columns" do
    end
  end

  xit "has a middle square called FREE SPACE" do
  end

  xit "can ask Game if it is a winner" do
  end
end


