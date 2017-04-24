class RemoveCodeFromSquares < ActiveRecord::Migration[5.0]
  def change
    remove_index :squares, :code
    remove_column :squares, :code, :string
  end
end
