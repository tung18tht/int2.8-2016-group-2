Feature: See other users
 	As a logged in user
 	I want to see other users in find friends tab
 	So that i can make friend with them

  Scenario: Find other users
  	Given another user who has a profile
  	And an user who has a profile
  	When I click on find friends
  	Then I should see Find Friends
  	And I should see find friends intro
  	And I should see the other users