require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.


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
#    ActiveSupport::Dependencies.clear
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

  RSpec::Matchers.define :include_module do |expected|
    match do |actual|
      actual.class == Class ?
        actual.include?(expected) :
        actual.class.include?(expected)
    end
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

  def pageable(*objects)
    objects.stub(:current_page){1}
    objects.stub(:num_pages){1}
    objects.stub(:limit_value){20}
    objects.stub_chain(:order_by, :page) {objects}
    objects
  end
  
  def some_user
    User.create!(:email=>"#{rand}@cool.com", :password=>'coms3dt.df', \
                        :password_combination=>'coms3dt.df'
    )
  end

  def some_new_project
    some_user.projects.create!(:name => "#{rand}")
  end

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, 
      {:layout => 'norcalfreediving'}.merge(stubs)).as_null_object
  end

  def save_should_fail(errors={ :anything => "any value (even nil)" })
    { :save => false, 
      :errors => errors
    }
  end
  def update_should_fail(errors={ :anything => "any value (even nil)" })
    { :update_attributes => false, 
      :errors => errors
    }
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
#  load "#{Rails.root}/config/routes.rb" 
#  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.





