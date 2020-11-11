class CreateImports < ActiveRecord::Migration[5.2]
  def change
    create_table :imports do |t|
      t.datetime :deleted_at, index: true
      t.timestamp
    end
  end
end
