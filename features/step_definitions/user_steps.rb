#-------------------------------------- GIVEN --------------------------------------------------

Given /^no user exists with an email "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am an existing user$/ do
  User.create! user
end

Given /^I am logged in$/ do
  step %{I go to the login page}
  step %{I fill in "user_email" with "#{user[:email]}"}
  step %{I fill in "Password" with "#{user[:password]}"}
  step %{I press "Sign in"}
end

Given /^I am logged out$/ do
  step %{I sign out}
end

Given /^I am not logged in$/ do
  step %{I sign out}
end

#-------------------------------------- WHEN --------------------------------------------------

When /^I sign in$/ do
  step %{I am not logged in}
  step %{I go to the login page}
  step %{I fill in "user_email" with "#{user[:email]}"}
  step %{I fill in "Password" with "#{user[:password]}"}
  step %{I press "Sign in"}
end

When /^I sign up as "(.*)\/(.*)\/(.*)"$/ do |email, password, confirmation|
  step %{I am not logged in}
  step %{I go to the signup page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I fill in "Password confirmation" with "#{confirmation}"}
  step %{I press "Sign up"}
end

When /^I return next time$/ do
  step %{I go to the home page}
end

When /^I sign out$/ do
  res = Capybara.current_session.driver.delete '/users/sign_out'
  Capybara.current_session.driver.follow 'get', res["Location"] if res.redirect?
end

When /^I change my user data as "(.*)\/(.*)\/(.*)\/(.*)"$/ do |email, name, password, confirmation|
  step %{I go to the home page}
  step %{I follow "Your Profile"}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_name" with "#{name}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I fill in "user_password_confirmation" with "#{confirmation}"}
  step %{I press "Update"}
end
#-------------------------------------- THEN --------------------------------------------------

Then /^I should be already signed in$/ do
  step %{I should see "Sign Out"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

Then /^I should not be signed in$/ do
  step %{I should see "Invalid email or password."}
end

Then /^I should be signed up$/ do
  step %{I should see "Welcome! You have signed up successfully."}
end

Then /^I should not be signed up$/ do
  step %{I should see "Sign up"}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign In"}
  step %{I should not see "Sign Out"}
end

Then /^User data should be "(.*)\/(.*)\/(.*)"$/ do |email, name, password|
  user = User.find_by_email_and_name(email, name)
  user.should_not be_nil
  user.valid_password?(password).should be_true
end

# helpers -------------------------------------------------------------------------------------

def user
  { :email => "test_user@todolist.com", :password => "please", :password_confirmation => "please" }
end

