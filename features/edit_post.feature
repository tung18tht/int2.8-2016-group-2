Feature: Edit post
  As a logged in users
  I want to edit my post
  So that I can change the mistakes I made

  Scenario: Users edit post
    Given a logged in user
    And I uploaded a post
    When I go to my profile
    And I click edit post
    Then I should be redirected to the edit page
    When I edit the caption
    Then I should be redirected my post
    And I should see the new caption
