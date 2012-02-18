Feature: Edit user profile
In order to display actual user data
As an existing user
I want to be able to change my personal info

Scenario: Unauthorised user cannot update profile
  Given I am not logged in
  When I go to the edit profile page
  Then I should see "You need to sign in or sign up before continuing"
  And I should be on the login page

@selenium @javascript
Scenario: User can edit his profile entering valid data
  Given I am an existing user
  And I am logged in
  When I change my user data as "new_email@gmail.com/New name/new_password/new_password"
  Then User data should be "new_email@gmail.com/New name/new_password"

@selenium @javascript
Scenario: User cannot update profile with invalid data
  Given I am an existing user
  And I am logged in
  When I change my user data as "/New name/new_password/new_wrong_password"
  Then User data should not change
  And I should see "Email can't be blank"
  And I should see "Password doesn't match confirmation"

