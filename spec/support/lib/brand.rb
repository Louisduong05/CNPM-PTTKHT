def create_a_brand()
  visit '/brands/new'
  within("#new_brand") do
    fill_in 'Name', with: 'Samsung'
    find("option[value='KP']").click
  end
  click_button 'Create Brand'
  expect(page).to have_content 'Luu thanh cong'
end