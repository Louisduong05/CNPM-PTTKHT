class AddCustomerToExports < ActiveRecord::Migration[5.2]
  def change
    add_reference :exports, :customer, foreign_key: true
  end
end
