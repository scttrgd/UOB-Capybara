Feature: CAS Login

Scenario: Visit main application
Given I visit the Blue Card Portal
Then I should redirect to the cas login

Scenario: I visit a specific transaction to add a comment
Given I visit a specific transaction to add a comment
Then I should redirect to the cas login page
