#-------------------------------------- GIVEN --------------------------------------------------

Given /^no user exists with an email "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am an existing user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  Rails.application.load_seed
  User.create! :email => email,
               :password => password,
               :password_confirmation => password
end

Given /^I am logged out$/ do
  step %{I sign out}
end

Given /^I am not logged in$/ do
  step %{I sign out}
end

#-------------------------------------- WHEN --------------------------------------------------

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the login page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Log In"}
end

When /^I return next time$/ do
  step %{I go to the home page}
end

#-------------------------------------- THEN --------------------------------------------------

Then /^I should be already signed in$/ do
  step %{I should see "Logout"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

Then /^I should not be signed in$/ do
  step %{I should see "Invalid email or password."}
end

Then /^I sign out$/ do
  delete '/users/sign_out'
end

Then /^I should be signed out$/ do
  step %{I should see "Sign up"}
  step %{I should see "Log In"}
  step %{I should not see "Log Out"}
end

