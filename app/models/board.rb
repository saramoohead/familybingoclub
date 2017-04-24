class Board < ApplicationRecord
  validates :code, uniqueness: true
  validates :category, presence: true

  has_and_belongs_to_many :squares

  after_create do
    # associate this board with 25 random squares
    r = Random.new
    square_count = Square.count
    byebug
    25.times do
      self.squares.create(Square.find(r.rand(1..square_count)))
    end
  end

  # you will probably want http://ruby-doc.org/core-1.9.2/Enumerable.html#method-i-take
  def board_square_ids
    # board_square_ids << self.squares.ids
    # return board_square_ids
    return @square_list
  end
end
