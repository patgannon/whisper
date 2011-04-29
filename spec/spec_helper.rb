ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'accept_values_for'
require 'discover'

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
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def stub_ability
  @ability = Object.new
  @ability.extend(CanCan::Ability)
  @controller.stub(:current_ability) {@ability}
end

def create_default_project
    User.create!(:email=>'manlyphall@foobar.com', :password=>'password', :password_confirmation=>'password').
projects.create!(:name=>'Norcal Freediving', :layout=>'norcalfreediving').tap{|project|
  project.domain_names.create!(:domain_name=>'example.org')
  project.domain_names.create!(:domain_name=>'www.22norcalfreediving.com')
  project.pages.create!(:title=>'Home', :html => 'Norcal Freediving Whassup!!!')
}
    @project = Project.last
    @project.pages.first.title.should == 'Home'
    @domain_name = @project.domain_names.first
    DomainName.stub(:where) { [@domain_name] }
    @domain_name.stub(:project) {@project}
end

def set_current_site
  @site = mock_model(Site).as_null_object
  Site.stub(:find).with(anything()) {@site}
end

def new_can_can_rule(base_behavior, action, subject, conditions=nil)
  CanCan::Rule.new base_behavior, action, subject, conditions, nil
end

def user(email)
  a = User.where(:email=>email).first
  a ? a : User.create(:email=>email, :password=>'coms3dt.df', \
                      :password_combination=>'coms3dt.df')
end

def some_new_user
  User.create! :email => "#{rand}@lagger.com", :password=>'coms3dt.df', \
                      :password_combination=>'coms3dt.df'
end

def build_project
  some_new_user.projects.build(:name => rand.to_s)
end

def some_new_project
  User.create!(:email=>'email54@car.com', :password=>'coms3dt.df', \
                      :password_combination=>'coms3dt.df'
  ).projects.create!(:name => 'My new project')
end


