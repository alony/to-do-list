# Given
# When

# Then
Then /^I should see a task form$/ do
  step %{I should see "Name"}
  step %{I should see "Description"}
  step %{I should see "Assigned to"}
  step %{I should see "Status"}
  step %{I should see "Priority"}
  find_button("Save").should_not be_nil
end

