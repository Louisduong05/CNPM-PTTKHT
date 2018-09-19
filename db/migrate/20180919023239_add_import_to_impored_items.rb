class AddImportToImporedItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :imported_items, :import, foreign_key: true
  end
end
