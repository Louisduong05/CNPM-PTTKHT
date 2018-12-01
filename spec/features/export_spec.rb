require 'rails_helper'

feature "Manage Export" do
  let!(:admin)    { create(:admin) }
  let!(:customer) { create(:customer) }
  let!(:product)  { create(:product) }

  before do 
    login_as(admin)
  end

  scenario "Create a export" do
    visit new_export_path
    within("#new_export") do
      find('#export_customer_id').find("option[value='#{customer.id}']").click
      select product.name, from: "export_exported_items_attributes_0_product_id"
      fill_in 'Quantity', with: '10'
    end
    click_button 'Create Export'
    expect(page).to have_content 'Luu thanh cong'
  end
end