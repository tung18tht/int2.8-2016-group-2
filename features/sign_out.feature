Feature: Sign out
As a logged in user
I want to log out
So that other users can log in

Scenario: An user signing out
Given I am on the home page as an logged in user
And I click on sign out
Then I should be redirected to home page
And I should see a Sign out success message
And I should see Sign in button