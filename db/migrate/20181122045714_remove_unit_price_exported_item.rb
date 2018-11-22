class RemoveUnitPriceExportedItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :exported_items, :unit_price
  end
end
