class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.references :pay_type, index: true, polymorphic: true
      t.references :user, index: true
      t.string :code
      t.integer :payment_by
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
