Feature: See, create, and edit news items

As a constiuent
So I can be politically active
I want to see and add news items for representatives

Background: Representatives in Database

    Given the following representatives exist:
    | name               | ocdid                            | title                               | party           | locationName|
    | Joseph R. Biden    | ocd-division/country:us          | President of the United States      | Democratic Party| 1600 Pennsylvania Avenue Northwest |
    Given I am on the login page
    And I press "Sign in with GitHub"

Scenario: Can see news items
    Given I am on the news page for "Joseph R. Biden"
    And I follow "Add News Article"
    And I fill in "Title" with "Biden wins election"
    And I fill in "Link" with "cnn.com"
    And I fill in "Description" with "He wins!"
    And I select "Joseph R. Biden" from "Representative"
    And I press "Save"
    And I follow "View all articles"
    Then I should see "Biden wins election"

