class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :num_of_guests, null: false 
      t.datetime :check_in_date, null: false
      t.datetime :check_out_date, null: false
      t.references :listing_id, null: false, index: true, foreign_key: {to_table: :listings}
      t.references :renter_id, null: false, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
