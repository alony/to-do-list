@selenium
@javascript

Feature: Edit user profile
In order to display actual user data
As an existing user
I want to be able to change my personal info

Scenario: User can edit his profile entering valid data
  Given I am an existing user
  And I am logged in
  When I change my user data as "new_email@gmail.com/New name/new_password/new_password"
  Then My data should change to "new_email@gmail.com", "New name", "new_password"

