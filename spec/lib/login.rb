def login(email, password, type)
  User.create(email: email, password: password, type: type)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', with: email
    fill_in 'Password', with: password
  end
  click_button 'Log in'
  expect(page).to have_content 'Signed in successfully'
end 

def login_user(email, password)
  login(email, password, "User")
end

def login_admin(email, password)
  login(email, password, "Admin")
end