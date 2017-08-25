Feature: Editing a customer account

Background:
  Given the user is logged in
  And the user attempts to visit the account search

Scenario Outline: Search and edit a customer record then reset the data
  Given the user searches using "<forename>"
  And they attempt to edit the customer record
  When they update the "<Field>" with "<ReplaceField>"
  Then they receive a confirmation message
  And they should confirm that "<forename>" is updated with "<ReplaceField>"
  And they should be able to return and revert the contents of "<Field>" to "<ReplaceFieldOriginal>" for "<forename>"

  Examples:
    | forename         | ReplaceFieldOriginal | ReplaceField | username      | Field   |
    | Test             | Account              | User         | t-it51        | surname |
