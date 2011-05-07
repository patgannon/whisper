require 'spec_helper'

describe Project do
  it { should have_field(:name).of_type(String) }
  it { should have_field(:description).of_type(String) }
  it { should be_referenced_in(:owner) }
  subject {Project.new(:title=>"Foobar")}
  it {should_not accept_values_for(:name, nil)}
  it {should_not accept_values_for(:owner, nil)}
  it {should accept_values_for(:owner, user('othertg@gmail.com'))}
  it {should reference_one(:web_root).of_type(Page)}
  it {should reference_many(:domain_names)}
  it {should have_many(:galleries)}
  it {should have_many(:articles)}
  it {should have_field(:paypal_email_address)}
  it {should have_field(:paypal_sandbox)}
  
  it "should build the web_root on creation" do
    some_new_project.web_root.should_not be_nil
  end
  
  it "should save the web_root when the project is saved." do
    some_new_project.web_root.new_record?.should be_false
  end
  
  it "should create a main menu before creation." do
    pending "This is next."
    proj = build_project
    proj.main_menu.should_not be_nil
    proj.main_menu.items.count.should be_greater_than(2)
  end
  
  it "should have the same web_root after saving." do
    proj = build_project
    proj.build_web_root
    proj.save
    same_proj = Project.find(proj.id)
    
    same_proj.web_root.should be == proj.web_root
  end
  
  it "should give the right stylesheet when a stylesheet has not been uploaded" do
    @project = Project.new
    @project.stylesheet.stub(:file?) { false }
    
    @project.stylesheet.should be == @project.layout
  end

  it "should give the right stylesheet when a stylesheet has been uploaded" do
    @project = Project.new
    @project.stylesheet_attachment.stub(:file?) { true }
    @project.stylesheet_attachment.stub(:url) { "/badass" }
    
    @project.stylesheet.should be == "/badass"
  end
end

