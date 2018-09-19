class AddPhoneAndAddressToSupplier < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :phone,          :string
    add_column :suppliers, :address,        :string 
  end
end
