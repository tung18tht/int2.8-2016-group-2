#Signing up test
Given(/^a logged in user$/) do
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
When(/^I go to the home page$/) do
	visit root_path
end
When(/^I click on sign up$/) do
	click_on "Sign Up"
end
Then(/^I should see the sign up page$/) do
	expect(current_path).to eq(new_user_registration_path)
end
When(/^I go to the sign up page$/) do
	visit new_user_registration_path
end
When(/^I fill in form$/) do
	fill_in "Email", :with => 'testing@usth.edu.vn'
	fill_in "Password", :with => '12345678'
	fill_in "Password confirmation", :with => '12345678'
end
When(/^I click on sign up button$/) do
	click_button "Sign up"
end
Then(/^I should be redirected to home page$/) do
 	expect(current_path).to eq(root_path)
end
Then(/^I should see a welcome message$/) do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end
Then(/^I'm automatically logged in$/) do
  expect(page).to have_content("Signed in as testing@usth.edu.vn")
end
Then(/^I should see the New post option$/) do
  expect(page).to have_content("New Post")
end
Then(/^I should see my email$/) do
  expect(page).to have_content("Signed in as testing@usth.edu.vn")
end
Then(/^I should not see the Sign up option$/) do
  expect(page).not_to have_content("Sign Up")
end
Then(/^I should see the Sign out option$/) do
  expect(page).to have_content("Sign Out")
end

#Signing out test
When(/^I click on sign out$/) do
  click_on "Sign Out"
end
Then(/^I should see a Sign out success message$/) do
  expect(page).to have_content("Signed out successfully.")
end
Then(/^I should see the Sign in button$/) do
  expect(page).to have_content("Sign In")
end

# Posts test
When(/^I click on new post$/) do
  click_on "New Post"
end
Then(/^I should see a new post page$/) do
  expect(current_path).to eq(new_post_path)
end
When(/^I go to new post page$/) do
  visit new_post_path
end
When(/^I upload an image$/) do
  attach_file 'image', 'public/system/posts/images/000/000/001/medium/012_-_b8Du2Oq.jpg'
end
When(/^I input a caption$/) do
  fill_in "Caption", :with => 'Demo'
end
When(/^I click on create post button$/) do
  click_button "Create Post"
end
