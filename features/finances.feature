Feature: Can search for financial information on cadidates based on cycle and category

As a constiuent
So that I can look at money in politics
I want to search financial data of candidates in a given cycle and category

Scenario: Finance Index page has dropdown menus
    Given I am on the finances page
    Then I should see "Cycle"
    And "Cycle" should contain "2010"
    And "Cycle" should contain "2012"
    And "Cycle" should contain "2014"
    And "Cycle" should contain "2016"
    And "Cycle" should contain "2018"
    And "Cycle" should contain "2020"
    Then I should see "Category"
    And "Category" should contain "Candidate Loan"
    And "Category" should contain "Contribution Total"
    And "Category" should contain "Debts Owed"
    And "Category" should contain "Disbursements Total"
    And "Category" should contain "End Cash"
    And "Category" should contain "Individual Total"
    And "Category" should contain "PAC Total"
    And "Category" should contain "Refund Total"

Scenario: Campaign Finance page shows correct finance information 
    Given I am on the finances page
    And I select "2020" from cycle_
    And I select "PAC Total" from category_
    And I press "Search"
    Then I should see "PERDUE, DAVID"

Scenario: Sad path, no cycle or category selected
    Given I am on the finances page
    And I press "Search"
    Then I should see "Please select a cycle and category"

Scenario: Sad path, no cycle selected
    Given I am on the finances page
    And I select "PAC Total" from category_
    And I press "Search"
    Then I should see "Please select a cycle"

Scenario: Sad path, no category selected
    Given I am on the finances page
    And I select "2020" from cycle_
    And I press "Search"
    Then I should see "Please select a category"


