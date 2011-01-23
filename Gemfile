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
# gem 'mongoid-tree', :require => 'mongoid/tree'  # Not actually in use.
gem 'oa-oauth', '0.2.0.beta2', :require => 'omniauth/oauth'

group :development, :test do
    #  Allows testing activemodel validations.
  gem 'accept_values_for', :git => 'https://github.com/tylergannon/accept_values_for.git'
    #  Offers support for some testing framework
  gem 'hpricot'

    #  Actual test frameworks
  gem 'gherkin', '2.3.2'
  gem 'mongoid-rspec', '1.3.2'
  gem 'rspec-rails', '2.4.1'
  gem 'capybara'
  gem 'webrat'

    # The following are just generators.  
  gem 'cucumber-rails' , :git => 'https://github.com/johnf/cucumber-rails.git'
  gem 'lipsum'  # Used in my_generators to generate lorem ipsum text.
  gem 'my_generators'
  gem 'haml-rails'
  gem 'jquery-rails'
end

group :test do
  gem 'autotest'
  gem 'database_cleaner'
end

# Use these commands to get gems installed locally with yarddoc for them all.
# gem install bluecloth yard
# gem install rails aws-s3 cancan cucumber-rails haml-rails hpricot accept_values_for  
# gem install jquery-rails lipsum capybara autotest database_cleaner webrat has_scope
# gem install bson_ext --pre
# gem install haml -v '3.0.25'
# gem install inherited_resources -v '1.1.2'
# gem install mongoid -v '2.0.0.beta.20'
# gem install mongoid-tree
# gem install oa-oauth --pre
# gem install mongoid-rspec -v '1.3.2'
# gem install rspec-rails -v '2.4.1'
# gem install devise --pre
