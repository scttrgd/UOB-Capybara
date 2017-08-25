Feature: Create Blue Card Portal User

Background:
  Given the user is logged in
  And the user attempts to visit the Blue Card user and project administration page

Scenario: User enters a valid Project Code
  When the user enters a valid project code
  And the user enters a valid User ID
  And the user clicks add
  Then the user should appear in the list of users

Scenario: User enters an invalid Project code
  When the user enters an invalid project code
  Then an invalid notice should be displayed for the user

Scenario Outline: User filters the list of blue card users
  When the user enters "<Filter Value>"
  Then the user should see appropriate results
  When the user clicks clear
  Then all original list items should appear

  Examples:
    | Filter Value        |
    | t-it51              |
    | CA-CS1ACH           |
    | iCareAdmin          |
    | Test-Two            |

Scenario: User removes user ID from the list of users
  When the user clicks delete against a valid user
  Then the user should no longer appear in the list
