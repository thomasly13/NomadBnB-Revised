class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body
      t.references :listing, null: false, index: true, foreign_key: {to_table: :listings}
      t.references :renter, null: false, index: true, foreign_key: {to_table: :users}
      t.references :reservation, null: false, index: :true, foreign_key: {to_table: :reservations}
      t.timestamps
    end
  end
end
