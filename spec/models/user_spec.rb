require 'spec_helper'
require 'cancan/matchers'

describe User do
  before :each do
    @site = Site.create(:domain=>'localhost')
    @user = @site.users.create(:email=>'tgannon@gmail.com', :alias=>'tgannon', :password=>'blahblah')
    @user.errors.should be_empty
  end
  
  after :each do
    DatabaseCleaner.clean
  end
  
  it "should have a :site field" do
    User.new.site
  end

  describe "default permissions" do
    it "Should let anyone read users" do
      @user.should be_able_to(:read, User.new)
    end
    it "should only let a user edit her own" do
      @user.should_not be_able_to(:edit, User.new)
      @user.should be_able_to(:edit, @user)
    end
  end  
  it "should respond to find_for_authentication" do
    User.find_for_authentication(:email=>'tgannon@gmail.com', 
                                 :domain=>'localhost').should == @user
  end
  
  it "should respond to to_key with site_id and user_id" do
    @user.to_key.should == [@site.id, @user.id]
  end
  
  it "should associate a new user with a domain if given" do
    User.new(:domain=>'localhost').site.should == @site
  end

  describe "to_adapter.get!" do 
    it "should find the user based on key of site and id" do
      User.to_adapter.get!(@user.to_key).should == @user
    end
    it "should raise an error if not found" do
      lambda {User.to_adapter.get!([@site.id, User.new.id])}.should raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end  
  
  describe "to_adapter.get" do 
    it "should find the user based on key of site and id" do
      User.to_adapter.get(@user.to_key).should == @user
    end
    it "should return nil if not found" do
      User.to_adapter.get([@site.id, User.new.id]).should be_nil
    end
  end  
  
  describe "to_adapter.find_first" do 
    it "should find the user based on site and other attributes" do
      Site.should_receive(:where).with(:domain=>'localhost') {[@site]}
      @site.users.should_receive(:where).with(:email =>'tgannon@gmail.com', :alias=>'tyler') {[@user]}
      
      User.to_adapter.find_first(
          :domain=>'localhost', 
          :email =>'tgannon@gmail.com', 
          :alias=>'tyler').should == @user
    end
    it "should raise an error if no site is given" do
      lambda{
        User.to_adapter.find_first(
        :email =>'tgannon@gmail.com', 
        :alias=>'tyler')}.should raise_error
    end
  end  
  
  describe Ability do
    it "Can be created from a CanDefinition" do
      a = Ability.from(new_can_definition true, :read, User, :id=>3425)
      a.user = @user
      a.save
      ability = @user.abilities.find(a.id)
      ability.attributes.should == {"base_behavior"=>true, 
              "actions"=>["read"], 
              "subjects"=>["User"], 
              "conditions"=>{"id"=>3425}, 
              "_id"=>a.id}
    end

    it "Can turn into a can definition" do
      a = Ability.from(new_can_definition true, :read, User, :id=>3425)
      a.user = @user
      a.save
      ability = @user.abilities.find(a.id)
      ability.attributes.should == {"base_behavior"=>true, 
              "actions"=>["read"], 
              "subjects"=>["User"], 
              "conditions"=>{"id"=>3425}, 
              "_id"=>a.id}
      a = ability.to_can_definition
      a.base_behavior.should be_true
      a.actions.should == [:read]
      a.instance_variable_get("@subjects").should == [User]
      a.instance_variable_get("@conditions").should == {"id"=>3425}
    end
  end  
end


