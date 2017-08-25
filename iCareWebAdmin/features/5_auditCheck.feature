Feature: Customer activity audit

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario Outline: Search and edit a customer record then reset the data
  Given the user searches using "<forename>"
  And the user clicks select customer
  Then the user should see all available customer accounts

  Examples:
    | forename |
    | Test     |
