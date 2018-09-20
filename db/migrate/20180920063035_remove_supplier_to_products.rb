class RemoveSupplierToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :supplier, foreign_key: true
  end
end
