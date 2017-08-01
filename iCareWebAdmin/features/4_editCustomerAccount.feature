Feature: Editing a customer account

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario Outline: User
  When the user inputs "<forename>" into forename
  And the user submits the search
  Then "<username>" should be included in the search results
  Examples:
    | forename         | surnameOriginal   | surnameReplace | username      |
    | Test             |                   |                | t-it51        |
    | Ben              |                   |                |               |
