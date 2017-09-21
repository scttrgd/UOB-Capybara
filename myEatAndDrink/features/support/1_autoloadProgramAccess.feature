Feature: AutoLoad Program Access
Users with different access should be redirected to different parts of the site

Background:
  Given the user attempts to visit the AutoLoad Program
  And the user is not logged in

Scenario: User with Finance Admin account logs into iCareAdmin
  When the User logs in as Finance Admin
  Then the user should be redirected back to the Batch Update Module

Scenario: User with Student Admin account logs into iCareAdmin
  When the User logs in as Student Admin
  Then the user should be denied access
