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
  
  it "should build the web_root on creation" do
    some_new_project.web_root.should_not be_nil
  end
  
  it "should save the web_root when the project is saved." do
    some_new_project.web_root.new_record?.should be_false
  end
  
  it "should have the same web_root after saving." do
    proj = build_project
    proj.build_web_root
    proj.save
    same_proj = Project.find(proj.id)
    
    same_proj.web_root.should be == proj.web_root
  end
end

