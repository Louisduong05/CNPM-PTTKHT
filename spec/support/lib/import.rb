def create_a_import()
  visit '/imports/new'
  within("#new_import") do
    find('#import_supplier_id').find("option[value='1']").click
    find('#import_imported_items_attributes_0_product_id').find("option[value='1']").click
    fill_in 'Quantity', with: '10'
  end
  click_button 'Create Import'
  expect(page).to have_content 'Luu thanh cong'
end