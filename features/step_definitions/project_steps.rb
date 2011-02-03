Given /^the following projects owned by "([^"]*)":$/ do |email, projects|
  user = User.where(:email=>email).first
  projects.hashes.each do |project|
    user.projects.create! project
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) project$/ do |pos|
  visit projects_path
  within("ul#projects li:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following projects:$/ do |expected_projects_table|
  expected_projects_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I have created a project%/ do
  Project.create!(:name => 'project sdfas', :description => 'sdfsdaretasd')
end

Given /^I have created a project with title "([^\"]*)"$/ do |project_title|
  User.last.projects.build(:title=>project_title)
end


Given /^within project "([^"]*)" I create the following pages:$/ do |proj_name, web_pages|
  project = Project.where(:name=>proj_name).
                    sort{|x,y| y.date_created <=> x.date_created}.first
  web_pages.hashes.each do |web_page|
    project.pages.create! web_page
  end
end
