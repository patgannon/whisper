require 'spec_helper'
require 'cancan/matchers'

describe User do
  before :each do
    @user = User.create(:email=>'tgannon@gmail.com', :alias=>'tgannon', :password=>'blahblah')
    @user.errors.should be_empty
  end
  
  describe "default permissions" do
    it "Should let anyone read users" do
      @user.should be_able_to(:read, User.new)
    end
    it "should only let a user edit her own" do
      @user.should_not be_able_to(:edit, User.new)
      @user.should be_able_to(:edit, @user)
    end
    
    it "should be able to create pages in its own projects" do
      @page = @user.projects.create!(:name=>'project1').pages.build
      @user.should be_able_to(:create, @page)
    end

    it "should be able to create galleries in its own projects" do
      @gallery = @user.projects.create!(:name=>'project1').galleries.build
      @user.should be_able_to(:create, @gallery)
    end

    it "should be able to create products in its own projects" do
      @product = @user.projects.create!(:name=>'project1').products.build
      @user.should be_able_to(:create, @product)
    end

    it "should not be able to create pages in someone else's projects" do
      @another_project = user('someone@yourbusiness.com').projects.create!(
         :name=>'project1')
      @page = @another_project.pages.build
      @user.should_not be_able_to(:create, @page)
    end
  end
  
  it "should respond to find_for_authentication" do
    User.find_for_authentication(:email=>'tgannon@gmail.com').should == @user
  end
  
  it "should respond to to_key with user_id" do
    @user.to_key.should == [@user.id]
  end
  

  describe "to_adapter.get!" do 
    it "should find the user based on key of id" do
      User.to_adapter.get!(@user.to_key).should == @user
    end
    it "should raise an error if not found" do
      lambda {User.to_adapter.get!([User.new.id])}.should raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end  
  
  describe "to_adapter.get" do 
    it "should find the user based on key of id" do
      User.to_adapter.get(@user.to_key).should == @user
    end
    it "should return nil if not found" do
      User.to_adapter.get([User.new.id]).should be_nil
    end
  end  
    
  describe Ability do
    it "Can be created from a Rule" do
      a = Ability.from(new_can_can_rule true, :read, User, :id=>3425)
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
      a = Ability.from(new_can_can_rule true, :read, User, :id=>3425)
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


