def create_a_customer()
  visit '/customers/new'
  within("#new_customer") do
    fill_in 'Name', with: 'Thach'
    fill_in 'Phone', with: '+8493274628734'
    fill_in 'Address', with: 'Address 1'
  end
  click_button 'Create Customer'
  expect(page).to have_content 'Save successfully'
end