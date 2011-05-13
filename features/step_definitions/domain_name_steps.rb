
def with_host(host)
  previous_host = Rack::Test::DEFAULT_HOST.dup
  Rack::Test::DEFAULT_HOST.replace host
  yield
ensure
  Rack::Test::DEFAULT_HOST.replace previous_host
end

# def some_new_project
#   User.create!(:email=>'email54@car.com', :password=>'coms3dt.df', \
#                       :password_combination=>'coms3dt.df'
#   ).projects.create!(:name => 'My new project')
# end

Given /^I have created the domain name "([^"]*)" for project "([^"]*)"$/ do |domain_name, project_name|
  project = Project.where(:name=>project_name).
                    sort{|x,y| y.date_created <=> x.date_created}.first
  unless DomainName.where(:domain_name=>domain_name, :project_id => project.id).exists?
    DomainName.create! :project => project, :domain_name => domain_name
  end
end


Then /^using "([^"]*)" I browse:$/ do |host, pages|
  begin
    old_host = Capybara.app_host
    raise "Host: #{old_host}!"
    Capybara.app_host = host

    pages.hashes.each do |page|
      visit "http://#{host}#{page["visit"]}"
      current_path.should == page["visit"]
      Then %{I should see "#{page["expect"]}"}
    end
  ensure
    Capybara.app_host = old_host
  end
end


