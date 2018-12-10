require 'rails_helper'

feature "Manage Brand" do
  let!(:admin) { create(:admin) }
  let!(:brand) { create(:brand) }

  before do 
    login_as(admin)
  end

  scenario "Create a brand" do
    visit new_brand_path
    within("#new_brand") do
      fill_in 'Name', with: 'Samsung'
      select 'Viet Nam', from: "brand_country"
    end
    click_button 'Create Brand'
    expect(page).to have_content 'Luu thanh cong'
  end
  scenario "Edit a Brand" do
    visit edit_brand_path(brand)
    within("#edit_brand_1") do
      fill_in 'Name', with: 'Samsung'
      select 'Hong Kong', from: "brand_country"
    end
    click_button 'Update Brand'
    expect(page).to have_content 'Cap nhat thanh cong'
  end
end