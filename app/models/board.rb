class Board < ApplicationRecord
  validates :code, uniqueness: true
  validates :category, presence: true

  has_and_belongs_to_many :squares

  after_create do
    give_board_25_squares
  end

  def give_board_25_squares
    r = Random.new

    id_of_squares_in_category = Square.where(category: self.category).ids.to_a
    @square_ids_to_insert = []

    25.times do
      rand_square_number = r.rand(0..(id_of_squares_in_category.count - 1))

      @square_ids_to_insert << id_of_squares_in_category[rand_square_number]
      id_of_squares_in_category.delete_at(rand_square_number)
    end

    insert_into_association
  end

  def insert_into_association
    @square_ids_to_insert.each do |sq|
      self.squares << Square.find(sq)
    end
  end

  # you will probably want http://ruby-doc.org/core-1.9.2/Enumerable.html#method-i-take
  def board_square_ids
    self.squares.ids
  end

  def validated_picture_board
    validated_picture_board = [[], [], [], [], []]

    index_of_id = 0
    index_of_array = 0

    5.times do
      5.times do
        index_of_id += 0
        validated_picture_board[index_of_array] << board_square_ids[index_of_id]
        index_of_id += 1
      end
      index_of_array += 1
    end

    validated_picture_board[2][2] = Square.where(description: "freespace").ids

    return validated_picture_board
  end
end
