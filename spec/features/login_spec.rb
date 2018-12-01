require 'rails_helper'

feature "Signing in" do
  let!(:user) { create(:user) }

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "123123123"
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end