Feature: Create new user
In order to have access to special functionality and info
As a registered user
I want to be able to sign up

Scenario: User can sign up with valid data
  Given I am not logged in
  When I sign up as "test_user@todolist.com/find_a_bug/find_a_bug"
  Then I should be signed up
  And I should see "Sign Out"

Scenario: User cannot sign up without email
  Given I am not logged in
  When I sign up as "/invalid/invalid"
  Then I should not be signed up
  And I should see "Email can't be blank"

Scenario: User cannot sign up without password
  Given I am not logged in
  When I sign up as "cheater@todolist.com//"
  Then I should not be signed up
  And I should see "Password can't be blank"

Scenario: User cannot sign up when password does not match confirmation
  Given I am not logged in
  When I sign up as "cheater@todolist.com/pwd/pwd_confirm"
  Then I should not be signed up
  And I should see "Password doesn't match confirmation"

Scenario: User cannot sign up when other user with that email is registered
  Given I am not logged in
  And I am an existing user
  When I sign up as "test_user@todolist.com/password/password"
  Then I should not be signed up
  And I should see "Email has already been taken"

