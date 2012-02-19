# Given

# When
When  /^I create new project "(.*)"$/ do |name|
  step %{I go to the home page}
  step %{I follow "Add project"}
  step %{I fill in "Name" with "#{name}"}
  step %{I press "Save"}
end

# Then
Then /^I should see a project form$/ do
  step %{I should see "New project"}
  step %{I should see "Name"}
  find_button("Save").should_not be_nil
end

Then /^A project "(.*)" should exist$/ do |name|
  Project.find_by_name(name).should_not be_nil
end

