class CreateFibs < ActiveRecord::Migration
  def change
    create_table :fibs do |t|
      t.integer :sequence_length
      t.integer :square_sum, limit:21
      t.text :sequence

      t.timestamps null: false
    end
  end
end
