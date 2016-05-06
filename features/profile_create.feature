Feature: Create profile
  As a logged in users
  I want to have a profile
  So that I can use the site and other people can see me

  Scenario: New user see profile
    Given a logged in user
    When I go to the home page
    Then I should see Create your profile button
    When I click on Create Profile
    Then I should see the Create Profile page

  Scenario: New user create a profile
    Given a logged in user
    When I click on Create Profile
    And I fill my information
    Then I should be redirected to the profile page
    And I should see my information
