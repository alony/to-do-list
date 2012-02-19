@selenium @javascript

Feature: Existing project can be edited
As an existing user
I want to be able to edit my projects
In order to keep them up-to-date

Scenario: User can change project name
  Given I am logged in
  And I have a project "my"
  When I change "my" project name to "new"
  Then I should see "Project was successfully updated."
  And A project "new" should exist

Scenario: User cannot change other users projects
  Given I am logged in
  And other users project "other" exists
  When I go to the edit "other" project page
  Then I should see "Sorry, not allowed"
  
Scenario: Project name cannot be erased
  Given I am logged in
  And I have a project "my"
  When I change "my" project name to ""
  Then I should see a edit project form
  And I should see "Name can't be blank"

