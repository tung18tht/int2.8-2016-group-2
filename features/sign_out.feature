Feature: Sign out
  As a logged in user
  I want to log out
  So that other users can log in

Scenario: An user signing out
Given a logged in user
When I click on sign out
Then I should be redirected to home page
And I should see the Sign in button

