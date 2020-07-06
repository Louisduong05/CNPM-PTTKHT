class AddUnitPriceToExportedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :exported_items, :unit_price, :integer
  end
end
