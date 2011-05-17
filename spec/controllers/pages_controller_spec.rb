require 'spec_helper'

describe PagesController do
  render_views
  
  before :each do
    create_default_project
  end
  
  it "shows the correct list of pages" do
    get :new, :project_id => @project.id
    
    assigns(:project).should == @project
    controller.instance_variable_get('@project').pages.first.title.should == 'Home'
  end
  
  it "shows the page id in the menu." do
    get :show, :project_id => @project.id, :id => @project.pages[0].id
    
    response.body.should =~ Regexp.new(@project.pages[0].id.to_s, 'm')
  end
  
  it "sorts pages correctly" do
    @project.pages.create! :title => 'dance'
    @id = @project.pages.last.id
    post :sort, :project_id => @project.id, :menu_page => @project.pages.reverse.map(&:id)
    
    @same_project = Project.find(@project.id)
    @same_project.pages.first.id.should == @id
  end
  
  it "allows me to edit pages" do
    @page = @project.pages.create! :title => 'dance', :html => 'This is a test'
    get :edit, :id => @page.id
    response.body.should =~ /This is a test/m
    
  end
end

