Feature: Bulk account creation

Background:
  Given the user is logged in
  And the user attempts to visit the bulk account creation screen

Scenario: User should only see one select option on the page
  When the user sees the select box
  Then the only select option should only be Eat and drink open university
