class AdjustListingTable < ActiveRecord::Migration[7.0]
  def change
    change_table :listings do |t|
      t.rename :num_of_bedss, :num_of_beds
      t.rename :owner_id_id, :owner_id
    end
    
  end
end
