Feature: List iCare Transactions by Trace ID

Background:
  Given the user is logged in
  And the user attempts to visit the iCare Transactions by Trace ID page

Scenario: User selects no criteria in the search
  Given the user leaves all fields as default
  And the user clicks view transactions
  Then the user should receive a minimum search criteria error

Scenario Outline: User selects different search combinations
  Given the user selects Program Code "<programCode>"
  And the user selects Transaction type with "<transType>"
  And the user selects Transaction group with "<transGroup>"
  And the user selects academic Year with "<academicYear>"
  And the user selects Load type with "<loadType>"
  When the user clicks view transactions
  Then the user should receive some results

  Examples:
    | programCode                  | transType  | transGroup | academicYear | loadType |
    | Eat and Drink Rolling        | Debit      | Any        | Any          | Any      |
    | Blue Card Standard           | Credit     | Any        | Any          | Any      |
    | Blue Card Standard           | Debit      | Any        | Any          | Any      |
    | Disruption Credit 2014       | Debit      | Any        | Any          | Any      |
    | Eat and Drink - Open Uni     | Any        | Any        | Any          | Any      |
    | Eat and Drink 2015           | Any        | Any        | Any          | Any      |
    | Eat and Drink 2016           | Any        | Any        | Any          | Any      |
    | Eat and Drink 2016 Extension | Any        | Any        | Any          | Any      |
