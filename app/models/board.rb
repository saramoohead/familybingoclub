class Board < ApplicationRecord
  validates :code, uniqueness: true
  validates :category, presence: true

  has_and_belongs_to_many :squares

  after_create do
    give_board_25_squares
  end

  # you will probably want http://ruby-doc.org/core-1.9.2/Enumerable.html#method-i-take
  def board_square_ids
    self.squares.ids
  end

  def give_board_25_squares
    r = Random.new

    squares_in_category = Square.where(category: self.category)
    square_count = squares_in_category.count

    25.times do
      rand_square_number = r.rand(0..(square_count - 1))
      self.squares << squares_in_category[rand_square_number]
    end
  end
end
