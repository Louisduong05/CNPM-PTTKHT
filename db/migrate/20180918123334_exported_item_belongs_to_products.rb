class ExportedItemBelongsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :exported_items, :product, foreign_key: true 
  end
end
