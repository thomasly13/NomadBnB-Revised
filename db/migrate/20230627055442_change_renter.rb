class ChangeRenter < ActiveRecord::Migration[7.0]
  def change
    change_table :reviews do |t|
      t.rename :renter_id, :reviewer_id
    end
  end
end
