require 'lib/login'
require 'lib/customer'
require 'lib/supplier'
require 'lib/brand'

describe "Table", type: :feature do
  it "create value table" do
    login_admin("admin@gmail.com", "password1")

    create_a_customer()
    create_a_supplier()
    create_a_brand()
  end
end