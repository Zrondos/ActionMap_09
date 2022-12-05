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
    And I select "Free Speech" from "Issue"
    And I select "Joseph R. Biden" from "Representative"
    And I press "Save"
    And I follow "View all articles"
    Then I should see "Biden wins election"

Scenario: Automatically fills in representative
    Given I am on the news page for "Joseph R. Biden"
    And I follow "Add News Article"
    Then I should see "Joseph R. Biden"

Scenario: Create news items with missing title
    Given I am on the create news page for "Joseph R. Biden"
    And I press "Save"
    Then I should see "provide an article title"

Scenario: Create news items with missing link
    Given I am on the create news page for "Joseph R. Biden"
    And I fill in "Title" with "Biden wins election"
    And I press "Save"
    Then I should see "Please provide an article link"

Scenario: Create news items with missing description
    Given I am on the create news page for "Joseph R. Biden"
    And I fill in "Title" with "Biden wins election"
    And I fill in "Link" with "cnn.com"
    And I press "Save"
    Then I should see "Please provide an article description"

Scenario: Create news items with missing issue
    Given I am on the create news page for "Joseph R. Biden"
    And I fill in "Title" with "Biden wins election"
    And I fill in "Link" with "cnn.com"
    And I fill in "Description" with "He wins!"
    And I select "Joseph R. Biden" from "Representative"
    And I press "Save"
    Then I should see "Please select an issue"

Scenario: Delete News items
    Given I am on the news page for "Joseph R. Biden"
    And I follow "Add News Article"
    And I fill in "Title" with "Biden wins election"
    And I fill in "Link" with "cnn.com"
    And I fill in "Description" with "He wins!"
    And I select "Free Speech" from "Issue"
    And I select "Joseph R. Biden" from "Representative"
    And I press "Save"
    And I follow "View all articles"
    Then I should see "Biden wins election"
    Then I press "Delete"
    Then I should see "News was successfully destroyed."
    And I should not see "Biden wins election"
