Given /^the following projects:$/ do |projects|
  projects.hashes.each do |project|
    Project.create! project
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