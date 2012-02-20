# Given
# When
When  /^I create new list "(.*)\/(.*)" for project "(.*)"$/ do |name, desc, project|
  step %{I create new project "#{project}"}
  step %{I fill in "Name" with "#{name}"}
  step %{I fill in "list_desc" with "#{desc}"}
  step %{I press "Save"}
end

# Then
Then /^I should see a (\S*) list form$/ do |action|
  step %{I should see "#{action.capitalize} task list"}
  step %{I should see "Name"}
  step %{I should see "Description"}
  step %{I should not see "Priority"}
  find_button("Save").should_not be_nil
end

