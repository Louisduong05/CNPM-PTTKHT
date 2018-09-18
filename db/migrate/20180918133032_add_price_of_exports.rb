class AddPriceOfExports < ActiveRecord::Migration[5.2]
  def change
    add_column :exports, :price,  :integer
  end
end
