require 'spec_helper'

describe PagesController do
  render_views
  
  before :each do
    User.create!(:email=>'manlyphall@foobar.com', :password=>'password', :password_confirmation=>'password').
projects.create!(:name=>'Norcal Freediving', :layout=>'norcalfreediving').tap{|project|
  project.domain_names.create!(:domain_name=>'example.org')
  project.domain_names.create!(:domain_name=>'www.22norcalfreediving.com')
  project.pages.create!(:title=>'Home', :html => 'Norcal Freediving Whassup!!!')
}
    @project = Project.last
    @project.pages.first.title.should == 'Home'

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
    post :sort, :project_id => @project.id, :menu_page => @project.pages.reverse.map(&:id)
    
    @same_project = Project.find(@project.id)
    @same_project.pages.order_by(:position).first.id.should == @project.pages.last.id
  end
end

