def create_a_product()
  visit 'products/new'
  within("#new_product") do
    fill_in 'Name', with: 'Iphone test'
    find("option[value='1']").click
    fill_in 'Remarks', with: 'Fild test'
  end
  click_button 'Create Product'
  expect(page).to have_content 'Luu thanh cong'
end
def edit_a_product()
  visit '/products/1/edit'
  within("#edit_product_1") do
    fill_in 'Name', with: 'Iphone edit'
    find("option[value='1']").click
    fill_in 'Remarks', with: 'edit'
  end
  click_button 'Update Product'
  expect(page).to have_content 'Cap nhat thanh cong'
end