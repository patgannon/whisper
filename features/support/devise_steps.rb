Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and alias "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :alias => login,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  user_alias = 'Tester_Alias'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to "/users/sign_in"}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I fill in "user_alias" with "#{user_alias}"}
  And %{I press "Sign in"}
end

Given /^I am logged in$/ do
  Given %{I am a new, authenticated user}
end

Given /^I am not logged in$/ do
  Given %{I am not authenticated}
end

