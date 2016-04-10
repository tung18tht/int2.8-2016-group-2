Feature: Sign up
  As a new user
  I want to sign up a new account
  So that I can log in

  Scenario: New user come to website
    When I go to the home page
    And I click on sign up
    Then I should see the sign up page

  Scenario: New user signing up
    When I go to the sign up page
    And I fill in form
    And I click on sign up button
    Then I should be redirected to home page
    And I should see a welcome message
    And I'm automatically logged in