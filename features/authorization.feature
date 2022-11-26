Feature: Can login and logout

As a user
So I can have a profile
I want to be able to login

Scenario: Login via Github
    Given I am on the login page
    When I press "Sign in with GitHub"
    And I go to the user profile page
    Then I should see "Your Profile"

Scenario: Login via Google
    Given I am on the login page
    When I press "Sign in with Google"
    And I go to the user profile page
    Then I should see "Your Profile"






