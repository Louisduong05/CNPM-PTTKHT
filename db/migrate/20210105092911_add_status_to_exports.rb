class AddStatusToExports < ActiveRecord::Migration[5.2]
  def change
    add_column :exports, :status, :integer, default: 0
  end
end
