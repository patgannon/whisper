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
    ids = ['1234', '5425', '647ag']
    Page.should_receive(:sort).with(ids)
    post :sort, :menu_page => ids
  end
  
  it "allows me to edit pages" do
    Page.should_receive(:find).with(any_old(Page).id) {any_old(Page)}
    @element = PageElement.new
    any_old(Page).stub(:elements) { [ @element ] }
    get :edit, :id => any_old(Page).id
    response.body.should =~ Regexp.new(@element.id.to_s, "m")
  end
  
  it "Saves stuff when pages are updated" do
    TextArea.should_receive(:find).with("4dd2f7e5872ceb7c39000008") {any_old(TextArea)}
    Page.should_receive(:find).with("234") {any_old(Page)}
    any_old(TextArea).should_receive(:update_attributes).with("html"=>"This is a stupid test.") {true}
    
    post :update, "id" => "234", "page_elements"=>{"0"=>{"type"=>"text_area", "id"=>"4dd2f7e5872ceb7c39000008", "data"=>{"html"=>"This is a stupid test."}}}
  
  end
  
end

