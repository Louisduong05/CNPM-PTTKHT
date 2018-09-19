class AddUserToImports < ActiveRecord::Migration[5.2]
  def change
    add_reference :imports, :user, foreign_key: true 
  end
end
