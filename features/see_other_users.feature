Feature: See other users
 	As a logged in user
 	I want to see other users in find friends tab
 	So that i can make friend with them

  Scenario: Find other users
  	Given a logged in user
  	And another registered user
  	When I click on find friends
  	Then I should see find friends tab
  	And I should see find friends intro
  	And I should see the other registered users