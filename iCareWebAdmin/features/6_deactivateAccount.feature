Feature: Deactivate customer account

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario Outline: Search and edit a customer record then reset the data
  Given the user searches using "<forename>"
  And the user clicks select customer
  When the user clicks Deactiate account
  Then the status of the Customer account should be inactive
  Then the user should be able to reactivate the account 

  Examples:
    | forename |
    | Test     |
