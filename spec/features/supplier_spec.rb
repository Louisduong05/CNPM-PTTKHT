require 'rails_helper'

feature "Manage Supplier" do
  let!(:admin) { create(:admin) }

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
end