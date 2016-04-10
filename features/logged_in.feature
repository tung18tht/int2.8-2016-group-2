Feature: Logging in
  As a logged in user
  I want to be able to make new post and sign out
  So that I can share photo and log out

  Scenario: User logged in
    Given a logged in user
    Then I should see the New post option
    And I should see my email
    And I should not see the Sign up option
    And I should see the Sign out option
