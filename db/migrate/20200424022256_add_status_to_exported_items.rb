class AddStatusToExportedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :exported_items, :status, :string
  end
end
