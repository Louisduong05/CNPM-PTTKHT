class CreateProductItems < ActiveRecord::Migration[5.2]
  def change
    create_table :product_items do |t|
      t.string :code
      t.references :product, index: true, foreign_key: true
      t.references :imported_item, index: true, foreign_key: true
      t.references :exported_item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
