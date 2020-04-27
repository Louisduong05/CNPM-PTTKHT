class AddWarehouseToExportedItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :exported_items, :warehouse, foreign_key: true
  end
end
