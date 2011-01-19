ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

SOME_USER_ID = 2346234523

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Mongoid::Matchers
  config.include Devise::TestHelpers, :type => :controller
  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.before :each do
   Devise::OmniAuth.short_circuit_authorizers!
   Devise::OmniAuth.stub!(:facebook) do |b|
     b.post('/oauth/access_token') { [200, {}, ACCESS_TOKEN.to_json] }
     b.get('/me?access_token=plataformatec') { [200, {}, FACEBOOK_INFO.to_json] }
   end
  end
  
  config.after :each do
   Devise::OmniAuth.unshort_circuit_authorizers!
   Devise::OmniAuth.reset_stubs!
  end

#  config.after(:each) do
#    DatabaseCleaner.clean
#  end
end

def set_current_site
  @site = mock_model(Site).as_null_object
  Site.stub(:find).with(anything()) {@site}
end

def new_can_can_rule(base_behavior, action, subject, conditions=nil)
  CanCan::Rule.new base_behavior, action, subject, conditions, nil
end

Devise::OmniAuth.test_mode!

# Inside our integration tests for Oauth
ACCESS_TOKEN = {
  :access_token => "plataformatec"
}

FACEBOOK_INFO = {
  :id => '12345',
  :link => 'http://facebook.com/user_example',
  :email => 'user@example.com',
  :first_name => 'User',
  :last_name => 'Example',
  :website => 'http://blog.plataformatec.com.br'
}






BULLSHIT = {"user_info"=>
  {"name"=>"Tyler Gannon", 
   "urls"=>{"Facebook"=>"http://www.facebook.com/tyboji", "Website"=>nil}, 
   "nickname"=>"tyboji", 
   "last_name"=>"Gannon", 
   "first_name"=>"Tyler"
  }, 
  "uid"=>"6714565", 
  "credentials"=>{"token"=>"111380765596113|f0b273423fd650e7e34183ab-6714565|imq0U8JaQQZBCOtruQkUWOPavuw"}, 
  "extra"=>
  {
    "user_hash"=>
    {
      "name"=>"Tyler Gannon", 
      "timezone"=>-8, 
      "gender"=>"male", 
      "id"=>"6714565", 
      "last_name"=>"Gannon", 
      "updated_time"=>"2010-12-23T21:38:26+0000", 
      "verified"=>true, 
      "locale"=>"en_US", 
      "link"=>"http://www.facebook.com/tyboji", 
      "email"=>"tgannon@gmail.com", "first_name"=>"Tyler"
    }
  }, 
  "provider"=>"facebook"
}

