Feature: login to the system
In order to have access to special functionality and info
As an existing user
I want to be able to sign in and out with my credentials

Scenario: Successfull login with correct credentials
  Given I am an existing user
  And I am not logged in
  When I sign in
  Then I should be signed in
  And I should see "Sign Out"

Scenario: Unregistered user cannot login
  Given no user exists with an email "test_user@todolist.com"
  And I am not logged in
  When I sign in
  Then I should not be signed in

