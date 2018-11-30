def create_a_export()
  visit '/exports/new'
  within("#new_export") do
    find('#export_customer_id').find("option[value='1']").click
    find('#export_exported_items_attributes_0_product_id').find("option[value='1']").click
    fill_in 'Quantity', with: '10'
  end
  click_button 'Create Export'
  expect(page).to have_content 'Luu thanh cong'
end