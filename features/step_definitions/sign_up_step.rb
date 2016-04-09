Given /^a valid user$/ do
  @user = User.create!({
             :email => "testing@usth.edu.vn",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit new_user_session_path
  fill_in "Email", :with => "testing@usth.edu.vn"
  fill_in "Password", :with => "12345678"
  click_button "Sign in"
end

When(/^I go to the home page$/) do
	visit root_path
end
When(/^I click on sign up$/) do
	click_on "Sign Up"
end
Then(/^I should see the sign up page$/) do
	visit new_user_registration_path
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
Then(/^I should redirect to the home page$/) do
  visit root_path
end
Then(/^I'm automatically logged in$/) do
  expect(page).to have_content("Signed in as testing@usth.edu.vn")
end

