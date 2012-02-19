Feature: New project can be created
As an existing user
I want to be able to create projects
In order to keep my todo lists organized

Scenario: Unauthorised user cannot create projects
  Given I am not logged in
  When I go to the new project page
  Then I should see "You need to sign in or sign up before continuing"
  And I should be on the login page

Scenario: User having no projects will see new project form on the home page_name
  Given I am logged in
  When I go to the home page
  Then I should see a new project form

@selenium @javascript
Scenario: Authorized user can create project specifying the name
  Given I am logged in
  When I create new project "Test"
  Then A project "Test" should exist

@selenium @javascript
Scenario: Project without name cannot be created
  Given I am logged in
  When I create new project ""
  Then I should be on the new project page
  And I should see "Name can't be blank"

