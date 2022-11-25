Feature: Search for Local Representative

As a constiuent
So that I can find my representatives
I want to search via my address

Background: representatives in database

    Given the following representatives exist:
    | name               | ocdid                            | title                               |
    | Joseph R. Biden    | ocd-division/country:us          | President of the United States      |
    | Kamala D. Harris   | ocd-division/country:us          | Vice President of the United States |
    | Alex Padilla       | ocd-division/country:us/state:ca | U.S. Senator                        |
    | Dianne Feinstein   | ocd-division/country:us/state:ca | U.S. Senator                        |

Scenario: Search leads to Representatives Table
    Given I am on the representatives page
    When I fill in "address" with "Berkeley"
    And I press "Search"
    Then I should see "Joseph R. Biden"

Scenario: Can click on Representative name to go to their profile
    Given I am on the representatives page
    When I fill in "address" with "Berkeley"
    And I press "Search"
    When I follow "Joseph R. Biden"
    Then I should be on the details page for "Joseph R. Biden"

Scenario: Representative Details Page Shows Correct Information
    Given I am on the details page for "Joseph R. Biden"
    Then I should see "Name: Joseph R. Biden"
    And I should see "Address:  White Houte"
    And I should see "Title: POTUS"

