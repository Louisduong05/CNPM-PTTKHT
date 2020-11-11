class CreateExports < ActiveRecord::Migration[5.2]
  def change
    create_table :exports do |t|
      t.datetime :deleted_at, index: true
    	t.timestamps
    end
  end
end
