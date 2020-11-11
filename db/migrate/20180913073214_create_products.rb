class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.integer :original_price, default: 0
    	t.integer :quantity, default: 0
			t.text :remarks
      t.boolean :is_active, default: true
      t.datetime :deleted_at, index: true
			t.timestamps
    end
  end
end
