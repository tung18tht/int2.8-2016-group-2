Feature: Superlike other user
	As a logged in user with a profile
	I want to click "superlike" on other people profile
	So that they know I have strong interest on them
	So that I can start talking with them

	Scenario: User superlike other users
		Given another user who has a profile
		And an user who has a profile
		And I am in find friend page
		Then I click on "Superlike"
		Then I should not see that user information
		And that another user who has a profile
		Then He should see some one superliked him

