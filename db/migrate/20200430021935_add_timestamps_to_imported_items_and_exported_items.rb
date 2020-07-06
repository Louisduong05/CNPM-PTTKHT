class AddTimestampsToImportedItemsAndExportedItems < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:imported_items)
    add_timestamps(:exported_items)
  end
end
