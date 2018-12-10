require 'rails_helper'

feature "Manage Supplier" do
  let!(:admin) { create(:admin) }
  let!(:supplier) { create(:supplier) }

  before do 
    login_as(admin)
  end

  scenario "Create a supplier" do
    visit new_supplier_path
    within("#new_supplier") do
      fill_in 'Ten Cong Ty ', with: 'Thach'
      fill_in 'Phone', with: '+8493274628734'
      fill_in 'Address', with: 'Address 1'
    end
    click_button 'Create Supplier'
    expect(page).to have_content 'Save successfully'
  end
  scenario "Edit a supplier" do
    visit edit_supplier_path(supplier)
    within("#edit_supplier_1") do
      fill_in 'Ten Cong Ty ', with: 'Thach da sua'
      fill_in 'Phone', with: '+8493274628734 44'
      fill_in 'Address', with: 'Address 1 da sua'
    end
    click_button 'Update Supplier'
    expect(page).to have_content 'Supplier has been updated successfully'
  end
end