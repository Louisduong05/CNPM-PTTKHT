class AddSupplierToImports < ActiveRecord::Migration[5.2]
  def change
    add_reference :imports, :supplier, foreign_key: true
  end
end
