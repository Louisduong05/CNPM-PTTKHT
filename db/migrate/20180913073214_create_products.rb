class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :price
    	t.integer :quantity
    	t.string :country
    	t.text :remarks
    	t.timestamps
    end
  end
end
