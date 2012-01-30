Feature: login to the system
In order to have access to special functionality and info
As an existing user
I want to be able to sign in and out with my credentials

Scenario: Successfull login with correct credentials
  Given I am an existing user "test_user@todolist.com" with password "find_a_bug"
  And I am not logged in
  When I sign in as "test_user@todolist.com/find_a_bug"
  Then I should be signed in
  And I should see "Sign Out"

Scenario: Unregistered user cannot login
  Given no user exists with an email "cheater@todolist.com"
  And I am not logged in
  When I sign in as "cheater@prozoob.com/invalid"
  Then I should not be signed in

