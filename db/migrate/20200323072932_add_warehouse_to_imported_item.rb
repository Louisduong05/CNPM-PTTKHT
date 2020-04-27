class AddWarehouseToImportedItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :imported_items, :warehouse, foreign_key: true
  end
end
