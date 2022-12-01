Feature: Can search for financial information on cadidates based on cycle and category

As a constiuent
So that I can look at money in politics
I want to search financial data of candidates in a given cycle and category

Scenario: Finance Index page has dropdown menus
    Given I am on the finances page
    # Then I should see a drop down called "Cycle" with options "2010, 2012, 2014, 2016, 2018, 2020"
    # And I should see a drop down menu called "Category" with options 
    # "Candidate Loan",
    # "Contribution Total",
    # "Debts Owed",
    # "Disbursements Total",
    # "End Cash"	,
    # "Individual Total",
    # "PAC Total"	,
    # "Receipts Total",
    # "Refund Total"	

#  Scenario: Campaign Finance page shows correct finance information 
    Given I am on the finances page
#     And I select "2020" from "Cycle"
#     And I select "PAC Total" from "Category"
#     And I follow "Search"
#     Then I should see "xyz"

# Scenario: Sad path, no cycle or category selected
    Given I am on the finances page
#     # And I do not select a cycle
#     # And I do not select a category
#     And I follow "Search"
#     Then I should see "Please select a cycle and category"

# Scenario: Sad path, no cycle selected
    Given I am on the finances page
#     And I select "PAC Total" from "Category"
#     And I follow "Search"
#     Then I should see "Please select a cycle"

# Scenario: Sad path, no category selected
    Given I am on the finances page
#     And I select "2020" from "Cycle"
#     Then I should see "Please select a category"


