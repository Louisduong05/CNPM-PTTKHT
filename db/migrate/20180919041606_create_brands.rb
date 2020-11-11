class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.boolean :is_active, default: true
      t.datetime :deleted_at, index: true
    end
  end
end
