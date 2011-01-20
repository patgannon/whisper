When /^I view the (\d+)(?:st|nd|rd|th) project$/ do |pos|
  visit projects_path
  within("ul#projects li:nth-child(#{pos.to_i+1})") do
    click_link "View"
  end
end

When /^I manage the (\d+)(?:st|nd|rd|th) project web site$/ do |pos|
  visit projects_path
  within("ul#projects li:nth-child(#{pos.to_i+1})") do
    click_link "Manage Web"
  end
end
