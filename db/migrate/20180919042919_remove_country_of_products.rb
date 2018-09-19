class RemoveCountryOfProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :country
  end
end
