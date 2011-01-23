When /^I view the (\d+)(?:st|nd|rd|th) project$/ do |pos|
  visit projects_path
  within("ul#projects li:nth-child(#{pos.to_i+1})") do
    click_link "View"
  end
end

When /^I manage the (\d+)(?:st|nd|rd|th) project web site$/ do |pos|
  visit projects_path
  within("ul#projects li:nth-child(#{pos.to_i})") do
    click_link "Manage Web"
  end
end

Given /^I am "([^"]*)" managing projects:$/ do |email, projects|
  Given %{I am logged in as "#{email}"}
  user = User.where(:email=>email).first
  projects.hashes.each do |project|
    user.projects.create! project
  end
end

Given /^I click on "([^"]*)"$/ do |arg1|
  click_link arg1
end
