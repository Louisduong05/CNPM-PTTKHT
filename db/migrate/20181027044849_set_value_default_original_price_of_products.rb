class SetValueDefaultOriginalPriceOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :original_price, :integer, :default => 0
  end
end
