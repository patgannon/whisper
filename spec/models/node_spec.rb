require 'spec_helper'

describe Node do
  before(:each) do
    @site = Site.create(:domain=>'localhost')
  end 
  
  it { should have_fields(:name, :path_fragment).of_type(String) }
  it { should have_field(:position).of_type(Integer) }
  
  describe "Children association" do
    it "Should always sort children" do
      a3 = @site.children.create({:name=>'niceface'},    Page)
      a1 = @site.children.create({:name=>'niceface-3'},  Page)
      a2 = @site.children.create({:name=>'niceface423'}, Page)
      [@site, a1, a2, a3].each(&:save)
      a1.update_attributes(:position => 0)
      a2.update_attributes(:position => 1)
      a3.update_attributes(:position => 2)
      @site.children.to_ary.should == [a1, a2, a3]
    end
  end

  describe "seek method" do
    it "Should return the root node when nothing given" do
      @site.seek.should == @site
    end
    
    it "Should look up children" do
      first_child = @site.children.create(:name=>'cool')
      @site.seek('cool').should == first_child
    end
    
    it "Should look up more children" do
      first_child = @site.children.create(:name=>'cool')
      second_child = first_child.children.create(:name=>'cool')
      @site.seek('cool', 'cool').should == second_child
    end
    
    it "Should identify the name into url_part" do
      first_child = @site.children.create(:name=>'Cool Beans')
      second_child = first_child.children.create(:name=>'Cool Hand Luke')
      @site.seek('cool-beans', 'cool-hand-luke').should == second_child
    end
    
    it "should return null if I ask for a non-existant node" do
      @site.seek('not-cool').should be_nil
    end
  end
  
  describe "url" do
    it "should know its own url" do
      a = Node.create(:name=>'nice')
      a.children.create(:name=>'cuberply')
      a.children.first.children.create(:name=>'Umberton Knicklesburn')
      a.children.first.children.first.url.should == "/cuberply/umberton-knicklesburn"
      
    end
  end
  
  describe "Validation" do
    it "should validate unique names among children of one node" do
      node1 = @site.children.create(:name => "NiceFace")
      node1.errors.should be_empty
      node2 =  @site.children.create(:name => "NiceFace" )
      node2.errors.should == {:name=>["Is already taken."]}
      node3 =  @site.children.create(:name => "NiceFace55" )
      node3.errors.should be_empty
    end
    
    it "validator should give the correct name for the 'canonical name'" do
      node1 = @site.children.create({:name => "NiceFace"}, Site)
      node1.errors.should be_empty
      node2 =  @site.children.create({:name => "NiceFace"}, Site )
      node2.errors.should == {:domain=>["Is already taken."]}
    end
  end

  after(:each) do
    Node.destroy_all
  end
end
