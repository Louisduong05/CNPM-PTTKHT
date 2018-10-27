class RenamePriceOnProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :price, :original_price
  end
end
