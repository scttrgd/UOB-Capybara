Feature: Customer Account List

Background:
  Given the user is logged in
  And the user attempts to visit the Program Accounts List

Scenario Outline: User selects all possible program types and ensures that the appropriate list is returned
  When the user selects "<Name>" from the Program Type select box
  And clicks View Accounts
  Then the user should see "<Name>" in the list

  Examples:
    | Name                         | Value          |
    | Eat and Drink Rolling        | EATDRINKRO     |
    | Blue Card Standard           | BLUECARDST     |
    | Disruption Credit 2014       | DISCREDIT4     |
    | Eat and Drink - Open Uni     | EATDRINKOU     |
    | Eat and Drink 2015           | EATDRINK15     |
    | Eat and Drink 2016           | EATDRINK16     |
    | Eat and Drink 2016 Extension | EATDRINKEXT16  |
