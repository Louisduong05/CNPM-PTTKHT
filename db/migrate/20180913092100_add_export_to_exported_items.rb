class AddExportToExportedItems < ActiveRecord::Migration[5.2]
  def change
  	add_reference :exported_items, :export, foreign_key: true 
  end
end
