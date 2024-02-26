class Changelistingtable < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :images, :string, array: true, null: false
  end
end
