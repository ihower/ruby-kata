class CreateSeatReservations < ActiveRecord::Migration
  def change
    create_table :seat_reservations do |t|
      t.integer :seat_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
