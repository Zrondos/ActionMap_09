Feature: Can add, edit, and see events

As a constiuent
So that I can inform my community about events
I want to add, edit, and see events for my area

Background: Login
    Given I am on the login page
    And I press "Sign in with GitHub"
    Given I am on the representatives page
    When I fill in "address" with "Berkeley"
    And I press "Search"
    Given the following events exist:
    |name | description | start_time |  end_time | county_id | 
    |Pride Parade | Annual pride parade| Time.zone.now + 4.weeks | Time.zone.now + 4.weeks + 1.hour | 1|
    Given the following states exist:
    | name          | symbol | fips_code | is_territory | lat_min | lat_max | long_min | long_max |
    | California    | CA     | 06        |0             | 0       | 0       | 0        | 0 |
    Given the following counties exist:
    | name              | state_id | fips_code | fips_class |
    | Alameda County    | 01        | 1         |0           |



Scenario: Can add and see events
    Given I am on the events page
    And I follow "Add New Event"
    And I fill in "Name" with "Town Hall"
    And I fill in "Description" with "Discussing property taxes"
    Then I should see "New event"

Scenario: Testing Web Steps
    Given I am on the events page
    And I follow "Reset Filters"
    Given I am on the home page
    Given I am on the state page for "California"
    Given I am on the county page for "Alameda County"
    Given I am on the state page for "Russia"
    Given I am on the county page for "Chester County"


