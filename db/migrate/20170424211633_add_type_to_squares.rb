class AddTypeToSquares < ActiveRecord::Migration[5.0]
  def change
    add_column :squares, :type, :string
  end
end
