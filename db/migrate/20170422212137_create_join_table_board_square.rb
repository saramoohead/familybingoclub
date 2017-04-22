class CreateJoinTableBoardSquare < ActiveRecord::Migration[5.0]
  def change
    create_join_table :boards, :squares do |t|
      t.index [:board_id, :square_id]
    end
  end
end
