ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Mongoid::Matchers
  config.include Devise::TestHelpers, :type => :controller
  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

#  config.after(:each) do
#    DatabaseCleaner.clean
#  end
end

def set_current_site
  @site = mock_model(Site).as_null_object
  Site.stub(:find).with(anything()) {@site}
end

def new_can_definition(base_behavior, action, subject, conditions=nil)
  CanCan::Rule.new base_behavior, action, subject, conditions, nil
end

Devise::OmniAuth.test_mode!

