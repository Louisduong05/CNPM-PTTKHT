describe "Table", type: :feature do
  it "create value table" do
    login_admin("admin@gmail.com", "password1")

    create_a_customer()
    create_a_supplier()
    create_a_brand()
    create_a_product()
    create_a_export()
    edit_a_product()
  end
end