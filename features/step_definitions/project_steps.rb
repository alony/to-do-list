# Given
Given /^I have a project "(.*)"$/ do |name|
  step %{I create new project "#{name}"}
end

Given /^other users project "(.*)" exists$/ do |name|
  author = User.create user.merge(email: "other_user@todo.com")
  Project.create name: name, author_id: author.id
end

# When
When  /^I create new project "(.*)"$/ do |name|
  step %{I go to the home page}
  step %{I follow "Add project"}
  step %{I fill in "Name" with "#{name}"}
  step %{I press "Save"}
end

When /^I change "(.*)" project name to "(.*)"$/ do |old_name, new_name|
  step %{I go to the home page}
  step %{I follow "#{old_name}"}
  step %{I follow "Edit project"}
  step %{I fill in "Name" with "#{new_name}"}
  step %{I press "Save"}
end

When /^I delete "(.*)" project$/ do |name|
  step %{I go to the home page}
  step %{I follow "#{name}"}

  page.evaluate_script('window.confirm = function() { return true; }')
  step %{I follow "Drop project"}
end

When /I try to delete "(.*)" project/ do |name|
  res = Capybara.current_session.driver.delete "/projects/#{Project.find_by_name("#{name}").id}"
  Capybara.current_session.driver.follow 'get', res["Location"] if res.redirect?
end

# Then
Then /^I should see a (\S*) project form$/ do |action|
  step %{I should see "#{action.capitalize} project"}
  step %{I should see "Name"}
  find_button("Save").should_not be_nil
end

Then /^A project "(.*)" should exist$/ do |name|
  Project.find_by_name(name).should_not be_nil
end

Then /^A project "(.*)" should not exist$/ do |name|
  Project.find_by_name(name).should be_nil
end

