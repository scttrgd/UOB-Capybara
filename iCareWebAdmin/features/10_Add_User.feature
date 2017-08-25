Feature: Create New User

Background:
  Given the user is logged in
  And the user attempts to visit the Add user page

Scenario: User enters invalid project code
  When the user enters an invalid project code into the project code field
  Then an invalid notice should be displayed for the user

Scenario: User enters valid project code
  When the user enters a valid project code into the project code field

Scenario Outline: User changes program code value
  When the user selects "<programCode>" from the Program Type select box
  Then the libraryCard field should be "<libraryCard>"
  Then the userId field should be "<userId>"
  Then the accommodationRmNo field should be "<accommodationRmNo>"
  Then the projectCode field should be "<projectCode>"
  Then the projectAuthoriser field should be "<projectAuthoriser>"
  Then the customerType field should be "<customerType>"
  And the user clicks Add
  Then the user should receive an error regarding missing Forename, surname and program information

  Examples:
    | programCode                  | libraryCard | userId   | accommodationRmNo | projectCode | projectAuthoriser | customerType            |
    | Eat and Drink Rolling        |             |          |                   | disabled    | disabled          |                         |
    | Blue Card Standard           | disabled    |          | disabled          |             |                   | Blue Card (Agresso)     |
    | Disruption Credit 2014       |             |          |                   |             |                   |                         |
    | Eat and Drink - Open Uni     | disabled    | disabled | disabled          | disabled    | disabled          | Open University Student |
    | Eat and Drink 2015           |             |          |                   | disabled    | disabled          | Catered Student         |
    | Eat and Drink 2016           |             |          |                   | disabled    | disabled          | Catered Student         |
    | Eat and Drink 2016 Extension |             |          |                   |             |                   |                         |
