Feature: Like other people
  As a logged in user with a profile
  I want to click "like" on other people profile
  So that I can start talking with them

  Scenario: Users like other users
   Given another user who has a profile
  	And an user who has a profile
    And I am in find friend page
    Then I click on "Like"
  	Then I should not see that user infomation



    