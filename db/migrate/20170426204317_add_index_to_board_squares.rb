class AddIndexToBoardSquares < ActiveRecord::Migration[5.0]
  def change
    remove_index :boards_squares, [:board_id, :square_id]
    add_index :boards_squares, [:board_id, :square_id], unique: true
  end
end
