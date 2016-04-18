Feature: See other users
 	As a logged in user
 	I want to see other users in find friends tab
 	So that i can make friend with them

  Scenario: Find other users
  	Given a logged in user
  	Given another logged in user
  	When I click on find friends
  	Then I should see find friends tab
  	Then I should see find friends intro
  	Then I should see another logged in user