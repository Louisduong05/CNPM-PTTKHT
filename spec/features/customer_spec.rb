require 'rails_helper'

feature "Manage Customer" do
  let!(:admin) { create(:admin) }

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
end