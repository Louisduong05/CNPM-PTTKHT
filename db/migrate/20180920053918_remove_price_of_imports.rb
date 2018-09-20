class RemovePriceOfImports < ActiveRecord::Migration[5.2]
  def change
    remove_column :imports, :price
  end
end
