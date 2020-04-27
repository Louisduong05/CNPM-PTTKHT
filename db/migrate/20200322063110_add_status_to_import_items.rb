class AddStatusToImportItems < ActiveRecord::Migration[5.2]
  def change
    add_column :imported_items, :status, :string
  end
end
