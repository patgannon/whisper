Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  create_user(email, password)
end

def create_user(email, password)
  user = User.where(:email=>email).first
  if user
    user.password = password
    user.password_confirmation = password
    user.save!
  else
    User.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
  end
end  

Given /^I am a new, authenticated user$/ do
  Given %{Existing user "testing@man.net" logged in with password "secretpass"}
end

Given /^Existing user "([^"]*)" logged in with password "([^"]*)"$/ do |email, password|
  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I browse to path /users/sign_in}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I am logged in$/ do
  Given %{I am a new, authenticated user}
end

Given /^I am not logged in$/ do
  Given %{I am not authenticated}
end

Given /^(?:|I )browse to (.+)$/ do |page_name|
  if page_name.index("path ")==0
    visit page_name.split(' ').last
  else
    visit path_to(page_name)
  end
end

Given /^I am logged in as "([^"]*)"$/ do |email|
  visit "/"
  user = User.create! :email=>email, :password=>'123joec00L', :password_confirmation=>'123joec00L'
  Given %{I browse to path /users/sign_in}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "123joec00L"}
  And %{I press "Sign in"}

end

When /^I log in as "([^\"]*)"$/ do |email|
  When %{I browse to the user sign out page}
  And %{I browse to the user sign in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "123joec00L"}
  And %{I press "Sign in"}
end

Given /^I have created a project$/ do
  Given %{I am logged in}
  Project.create(:title=>'Some project', :description=>'lorem ipsum', :owner=>User.last)
end

When /^I edit that project$/ do
  Given %{I am on the edit page for a new project}
end

Given /^I manage my own project$/ do
  Given %{I am logged in}
  And %{I have created a project}
  And %{I edit that project}
end

Given /^I click "([^"]*)"$/ do |arg1|
  Given %{I follow "#{arg1}" }
end

Then /^I should see editable content$/ do
  pending # express the regexp above with the code you wish you had
end
