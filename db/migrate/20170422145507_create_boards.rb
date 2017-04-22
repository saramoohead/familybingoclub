class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :code
      t.string :type

      t.timestamps
    end
    add_index :boards, :code, unique: true
  end
end
