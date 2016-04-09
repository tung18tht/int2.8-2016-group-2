When(/^I go to the home page$/) do
	visit root_path
end
When(/^I click on sign up button$/) do
	click_on "Sign Up"
end
Then(/^I should see the sign up page$/) do
	visit new_user_registration_path
end