class ChangeTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :squares, :type, :category
  end
end
