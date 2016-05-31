    Feature: Match user
    As two logged in user with profiles
    They want to see other users who like them in matches tab
    So that they can start talking

    
    Scenario: Match user 
    Given another user who has a profile
    And an user who has a profile
    Given I am in find friend page
    When I click on "Like"
    And I should not see that user infomation
    Then I click on "Sign Out"
    Then that user log in
    Then that user click on "Like"
    And that user should not see my information
    Then that user visit matches page
    Then that user should see match intro 
    Then that user should see the other users who like them
