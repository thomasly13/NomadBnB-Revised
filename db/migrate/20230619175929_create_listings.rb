class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.text :description, null: false 
      t.integer :price, null: false 
      t.string :address, null: false 
      t.string :coordinates, null: false 
      t.string :amenities, null: false 
      t.integer :num_of_guests, null: false 
      t.integer :num_of_baths, null: false
      t.integer :num_of_bedrooms, null: false
      t.integer :num_of_bedss, null: false
      t.references :owner_id, null: false, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
