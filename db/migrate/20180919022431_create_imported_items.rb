class CreateImportedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :imported_items do |t|
      t.integer :quantity
      t.integer :unit_price
      t.datetime :deleted_at, index: true
    end
  end
end
