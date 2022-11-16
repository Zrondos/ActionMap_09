Feature:

As a constinuent
So that I can research representatives
I want to search for representatives and see their profile

Background: representatives in database


Scenario: Search for representative profile
    Given I am on the search page
    And I fill in "Search" with "AOC"
    And I press "Search"
    Then I should be on AOC's profile page

Scenario: See correct information
    Given I am on AOC's profile page
    Then I should see "District = 12"

Scenario: Go to representative profile from News Item
    Given I am on the new's item page
    And I see NY Primary
    And I follow "AOC"
    Then I should be on AOC's profile page





