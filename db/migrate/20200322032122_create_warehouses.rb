class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.integer :current, default: 0
      t.integer :capacity
      t.boolean :status, default: false
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
