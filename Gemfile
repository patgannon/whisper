source 'http://rubygems.org'

gem 'rails'

gem 'bson_ext'
gem 'mongoid', '2.0.1'
gem 'mongoid-tree', :require => 'mongoid/tree'  # Not actually in use.

gem 'mongoid-paperclip', :require => "mongoid_paperclip"
gem 'aws-s3', :require => 'aws/s3'



gem 'devise'
gem 'oa-oauth', '0.2.0', :require => 'omniauth/oauth'
gem 'cancan'

gem 'haml'
gem 'inherited_resources'

group :development, :test do
  gem 'accept_values_for'
  gem 'hpricot'

    #  Actual test frameworks
  gem 'gherkin'
  gem 'mongoid-rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'webrat'

    # The following are just generators.  
  gem 'cucumber-rails'
  gem 'haml-rails'
  gem 'jquery-rails'
end

group :test do
  gem 'autotest'
  gem 'database_cleaner'
end


