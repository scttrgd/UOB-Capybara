Feature: Search For User Accounts

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario: User attempts to search without filling any fields
  When the user submits the search form
  And the form is empty
  Then the user should receive an error

Scenario Outline: User attempts to search for customers
  When the user inputs "<forename>" into forename
  And the user inputs "<surname>" into surname
  And the user inputs "<libraryCard>" into library card
  And the user inputs "<email>" into email
  And the user inputs "<projectCode>" into project code
  And the user inputs "<iCareCustomerNo>" into icare customer number
  And the user submits the search
  Then "<forename>" should be included in the search results
  Examples:
    | forename | surname     | libraryCard | email              | projectCode | iCareCustomerNo |
    | Ben      | Scattergood | 1100695740    | bjs62@bath.ac.uk |             | 10069574        |
    | Ben      | Scattergood | 1100695740    | bjs62@bath.ac.uk | CA-CS1HRE   |                 |
    | Leonie   | Baker       |               |                  |             |                 |
    | Leonie   | Baker       | 1100695740    | bjs62@bath.ac.uk | CA-CS1HRE   | 10061972        |
    | This     | Wont        | Find          | Any              | Valid       | Users           |
