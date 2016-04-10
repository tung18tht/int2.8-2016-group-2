Given(/^I am on the home page as an logged in user$/) do
   @user = User.create!({
             :email => "testing@usth.edu.vn",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
  visit new_user_session_path
  fill_in "Email", :with => 'testing@usth.edu.vn'
  fill_in "Password", :with => '12345678'
  click_button "Log in"
  visit root_path
  expect(page).to have_content("New Post")
end
When(/^I click on sign out$/) do
  click_on "Sign Out"
end
Then(/^I should be redirected to home page$/) do
  expect(current_path).to eq(root_path)
end
Then(/^I should see a Sign out success message$/) do
  expect(page).to have_content("Signed out successfully.")
end
Then(/^I should see Sign in button$/) do
  expect(page).to have_content("Sign In")
end