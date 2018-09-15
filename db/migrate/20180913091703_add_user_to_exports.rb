class AddUserToExports < ActiveRecord::Migration[5.2]
  def change
  	add_reference :exports, :user, foreign_key: true 
  end
end