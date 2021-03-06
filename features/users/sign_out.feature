Feature: logout from the system
In order restrict other user from using my account
As an existing user
I want to be able to log out

Scenario: Logout from the system
  Given I am logged in
  When I sign out
  Then I should be signed out
  And I should see "Signed out successfully."

