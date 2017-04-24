class AddColumnsToSquares < ActiveRecord::Migration[5.0]
  def change
    add_column :squares, :description, :string
    add_column :squares, :creator, :string
    add_column :squares, :local_src, :string
    add_column :squares, :organisation, :string
    add_column :squares, :exclude, :boolean
    add_column :squares, :number, :integer
  end
end
