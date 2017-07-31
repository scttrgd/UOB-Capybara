Feature: Search For User Accounts with invalid input data

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario Outline: User attempts to search for customers with data which will cause validation errors
  When the user inputs "<forename>" into forename
  And the user inputs "<surname>" into surname
  And the user inputs less than ten characters - "<libraryCard>" into Library Card
  And the user inputs "<email>" into email
  And the user inputs "<projectCode>" into project code
  And the user inputs "<iCareCustomerNo>" into icare customer number
  And the user submits the search
  Then a validation error should occur
  Examples:
    | forename         | surname          | libraryCard   | email            | projectCode | iCareCustomerNo |
    | LibraryCard      | LessThanTenChars | 123456789     |                  |             |                 |
