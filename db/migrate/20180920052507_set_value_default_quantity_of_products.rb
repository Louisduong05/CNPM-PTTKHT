class SetValueDefaultQuantityOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :quantity, :integer, :default => 0
  end
end
