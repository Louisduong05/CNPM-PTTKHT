def create_a_supplier()
  visit '/suppliers/new'
  within("#new_supplier") do
    fill_in 'Ten Cong Ty ', with: 'Thach'
    fill_in 'Phone', with: '+8493274628734'
    fill_in 'Address', with: 'Address 1'
  end
  click_button 'Create Supplier'
  expect(page).to have_content 'Save successfully'
end