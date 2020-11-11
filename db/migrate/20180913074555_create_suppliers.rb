class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.datetime :deleted_at, index: true
    	t.timestamps
    end
  end
end
