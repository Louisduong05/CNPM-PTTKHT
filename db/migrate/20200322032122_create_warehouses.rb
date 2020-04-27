class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :current
      t.string :capacity
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
