class AddStatusInImport < ActiveRecord::Migration[5.2]
  def change
    add_column :imports, :status, :integer, default: 0
  end
end
