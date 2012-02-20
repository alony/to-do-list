Feature: New task list can be created within an existing project
As an existing user
I want to be able to create todo lists
In order to keep my tasks organized

Scenario: Unauthorised user cannot create lists
  Given I am not logged in
  When I go to the new list page
  Then I should see "You need to sign in or sign up before continuing"
  And I should be on the login page

@selenium @javascript
Scenario: User having no lists will see new project form on the home page_name
  Given I am logged in
  And I have a project "Test"
  When I go to the home page
  Then I should see a new list form

@selenium @javascript
Scenario: Authorized user can create list specifying the name and description
  Given I am logged in
  When I create new list "Task list/Description" for project "Test"
  Then A list "Task list" should exist
  And I should see "You don't have any tasks here. Add one"
  And I should see a task form

@selenium @javascript
Scenario: Task without name cannot be created
  Given I am logged in
  When I create new list "/Description" for project "Test"
  Then A list "Test" should not exist
  And I should see "Name can't be blank"

