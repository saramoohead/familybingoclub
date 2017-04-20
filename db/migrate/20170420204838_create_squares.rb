class CreateSquares < ActiveRecord::Migration[5.0]
  def change
    create_table :squares do |t|
      t.string :code
      t.timestamp :called_timestamp

      t.timestamps
    end
    add_index :squares, :code, unique: true
  end
end
