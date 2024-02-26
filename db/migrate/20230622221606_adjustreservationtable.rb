class Adjustreservationtable < ActiveRecord::Migration[7.0]
  def change
    change_table :reservations do |t|
      t.rename :listing_id_id, :listing_id
      t.rename :renter_id_id, :renter_id  
    end
  end
end
