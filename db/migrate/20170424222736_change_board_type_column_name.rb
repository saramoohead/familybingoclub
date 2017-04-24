class ChangeBoardTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :type, :category
  end
end
