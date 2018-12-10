require 'rails_helper'
feature "Manage Customer" do
  let!(:admin) { create(:admin) }
  let!(:customer) { create(:customer) }

  before do 
    login_as(admin)
  end

  scenario "Create a customer" do
    visit new_customer_path
    within("#new_customer") do
      fill_in 'Name', with: 'Thach'
      fill_in 'Phone', with: '+8493274628734'
      fill_in 'Address', with: 'Address 1'
    end
    click_button 'Create Customer'
    expect(page).to have_content 'Save successfully'
  end
  scenario "Edit a customer" do
    visit edit_customer_path(customer)
    within("#edit_customer_1") do
      fill_in 'Name', with: 'Thach da sua'
      fill_in 'Phone', with: '+8493274628734 44'
      fill_in 'Address', with: 'Address 1 da sua'
    end
    click_button 'Update Customer'
    expect(page).to have_content 'customer has been updated successfully'
  end
end