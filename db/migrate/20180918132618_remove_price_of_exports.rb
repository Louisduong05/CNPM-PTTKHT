class RemovePriceOfExports < ActiveRecord::Migration[5.2]
  def change
    remove_column :exports, :price
  end
end
