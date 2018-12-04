require 'rails_helper'

feature "Manage Export" do
  let!(:admin)    { create(:admin) }
  let!(:supplier) { create(:supplier) }
  let!(:product)  { create(:product) }

  before do 
    login_as(admin)
  end

  scenario "Create a import" do
    visit new_import_path
    within("#new_import") do
      find('#import_supplier_id').find("option[value='#{supplier.id}']").click
      select product.name, from: "import_imported_items_attributes_0_product_id"
      fill_in 'Quantity', with: '10'
      fill_in 'Unit price', with: '120'
    end
    click_button 'Create Import'
    expect(page).to have_content 'Luu thanh cong'
  end
end