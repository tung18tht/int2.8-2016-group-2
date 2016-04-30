Feature: Delete post
  As a logged in users
  I want to delete my post
  So that I can remove unwanted photo

  Scenario: Users edit post
    Given a logged in user
    And I uploaded a post
    When I go to my profile
    And I click delete post

