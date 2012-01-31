Feature: logout from the system
In order restrict other user from using my account
As an existing user
I want to be able to log out

Scenario: Logout from the system
  Given I am an existing user "test_user@todolist.com" with password "find_a_bug"
  And I am logged in as "test_user@todolist.com/find_a_bug"
  When I go to the logout page
  Then I should be signed out
  And I should see "Signed out successfully."

