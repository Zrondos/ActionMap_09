Feature: Search for Local Representative

As a constiuent
So that I can find my representatives
I want to search via my address

Background: representatives in database

    Given the following representatives exist:
    | name               | ocdid                            | title                               | party           | locationName|
    | Joseph R. Biden    | ocd-division/country:us          | President of the United States      | Democratic Party| 1600 Pennsylvania Avenue Northwest |
    | Kamala D. Harris   | ocd-division/country:us          | Vice President of the United States | Democratic Party||
    | Alex Padilla       | ocd-division/country:us/state:ca | U.S. Senator                        | Democratic Party||
    | Dianne Feinstein   | ocd-division/country:us/state:ca | U.S. Senator                        | Democratic Party||

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
    Given I am on the representatives page
    When I fill in "address" with "Berkeley"
    And I press "Search"
    When I follow "Joseph R. Biden"
    Then I should be on the details page for "Joseph R. Biden"
    And I should see "Joseph R. Biden"
    And I should see "President of the United States"
    And I should see "Democratic Party"
    And I should see "1600 Pennsylvania Avenue Northwest"

Scenario: Representatives table shows representatives even if already in DB 
    Given I am on the representatives page
    When I fill in "address" with "Berkeley"
    And I press "Search"
    Then I go to the representatives page
    And I fill in "address" with "Berkeley"
    And I press "Search"
    Then I should see "Henry C. Levy" exactly once