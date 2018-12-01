require 'rails_helper'

feature "Manage Product" do
  let!(:admin) { create(:admin) }
  let!(:brand) { create(:brand) }
  let!(:product) { create(:product) }

  before do 
    login_as(admin)
  end

  scenario "Create a product" do
    visit new_product_path
    within("#new_product") do
      fill_in 'Name', with: 'Iphone test'
      select brand.name, from: "product_brand_id"
      fill_in 'Remarks', with: 'Fild test'
    end
    click_button 'Create Product'
    expect(page).to have_content 'Luu thanh cong'
  end

  scenario "Edit a product" do
    visit edit_product_path(product)
    within("#edit_product_1") do
      fill_in 'Name', with: 'Iphone edit'
      select brand.name, from: "product_brand_id"
      fill_in 'Remarks', with: 'edit'
    end
    click_button 'Update Product'
    expect(page).to have_content 'Cap nhat thanh cong'
  end
end