Feature: Existing project can be removed by author
As an existing user
I want to be able to remove my projects
In order not to keep expired data


Scenario: User cannot remove other users projects
  Given I am logged in
  And other users project "other" exists
  When I try to delete "other" project
  Then I should see "Sorry, not allowed"

@selenium @javascript
Scenario: User can remove project
  Given I am logged in
  And I have a project "my"
  When I delete "my" project
  Then A project "my" should not exist

