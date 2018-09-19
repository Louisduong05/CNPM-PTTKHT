class ImportedItemsBelongsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :imported_items, :product, foreign_key: true 
  end
end
