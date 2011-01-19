source 'http://rubygems.org'

#  Known version dependencies: 
#       rspec-rails 2.4.1 for compatibility with mongoid-rspec
#       mongoid 2.0.0.beta.20 for compatibility with mongoid-tree
#          Who knows why they introduced breaking changes with rc.1?
                                                                

gem 'rails', '3.0.3'

gem 'aws-s3', :require => 'aws/s3'
gem 'bson_ext', '1.2.rc2'
gem 'cancan', '1.5.0'
gem 'devise', :git => 'https://github.com/plataformatec/devise.git'  
gem 'haml', '3.0.25'
gem 'inherited_resources', '1.1.2'
gem 'mongoid', '2.0.0.beta.20'
gem 'mongoid-tree', :require => 'mongoid/tree'
gem 'oa-oauth', '0.2.0.beta2', :require => 'omniauth/oauth'
#gem 'openpgp'

group :development, :test do
  gem 'gherkin', '2.3.2'
  gem 'cucumber-rails' , :git => 'https://github.com/johnf/cucumber-rails.git'
  gem 'haml-rails'
  gem 'hpricot'
  gem 'jquery-rails'
  gem 'lipsum'  # Used in my_generators to generate lorem ipsum text.
  gem 'mongoid-rspec', '1.3.2'
  gem 'my_generators', :path => "/Users/tyler/ruby/current/my_generators"
  gem 'rspec-rails', '2.4.1'
  gem 'capybara'
  gem 'webrat'
end

group :test do
  gem 'autotest'
  gem 'database_cleaner'
end

# Use these commands to get gems installed locally with yarddoc for them all.
# gem install bluecloth yard
# gem install rails aws-s3 cancan cucumber-rails haml-rails hpricot  
# gem install jquery-rails lipsum capybara autotest database_cleaner webrat
# gem install bson_ext --pre
# gem install haml -v '3.0.25'
# gem install inherited_resources -v '1.1.2'
# gem install mongoid -v '2.0.0.beta.20'
# gem install mongoid-tree
# gem install oa-oauth --pre
# gem install mongoid-rspec -v '1.3.2'
# gem install rspec-rails -v '2.4.1'
# gem install devise --pre
