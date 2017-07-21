Feature: Account Check

Scenario: Profile with accounts logs into Blue Card Portal
Given I visit the Blue Card Portal and log in
When I log in at the cas redirect page
Then I should shown the Blue Card Administration Page
