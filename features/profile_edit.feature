Feature: Editing profile
  As a logged in user with a profile
  I want to edit my profile
  So that I can change my information

  Scenario: Users edit profile
    Given an user who has a profile
    When I go to my profile
    And I click edit profile
    Then I should be redirected to the edit profile page
    When I edit my information
    Then I should be redirected to the profile page
    And I should see my new information

  Scenario: Another user try to edit others' profile
    Given another user who has a profile
    And an user who has a profile
    When I follow "profiles/1/edit" 
    Then I should be redirected to home page