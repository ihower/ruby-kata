class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :name
      t.integer :train_id
      t.timestamps
    end
  end
end
