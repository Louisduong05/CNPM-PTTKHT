class DeleteBrands < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :brand, foreign_key: true
    drop_table :brands
  end
end
8