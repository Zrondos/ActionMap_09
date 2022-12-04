Feature: Can interact with the navbar from any page

As a user
So I can navigate the site
I want to be able to interact with the navbar from any page

Scenario: Go to the home page
    Given I am on the events page
    When I follow "Home"
    Then I should be on the home page

Scenario: Go to the events page
    Given I am on the home page
    When I follow "Events"
    Then I should be on the events page

Scenario: Go to the representative page
    Given I am on the home page
    When I follow "Representatives"
    Then I should be on the representatives page

Scenario: Go to the finances page
    Given I am on the representatives page
    When I follow "Finances"
    Then I should be on the finances page

Scenario: Go to the profile page
    Given I am on the login page
    When I press "Sign in with Google"
    When I follow "Profile"
    Then I should be on the profile page
