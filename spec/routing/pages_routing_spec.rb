require "spec_helper"

describe PagesController do
  describe "routing" do
    
    it "Captures unrecognized routes as web page paths" do
      { :get => "/Home" }.should route_to(:controller => "pages", :title1 => "Home", :action => "show")
      { :get => "/Home/About-Us" }.should route_to(:controller => "pages", :title1 => "Home", :title2=>"About-Us", :action => "show")
    end

    it "recognizes and generates #index" do
      { :get => "/projects/2345/pages" }.should route_to(:controller => "pages", :project_id => "2345", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/projects/2345/pages/new" }.should route_to(:controller => "pages", :project_id => "2345", :action => "new")
    end

    it "recognizes and generates #sort" do
      { :post => "/projects/2345/pages/sort" }.should route_to(:controller => "pages", :project_id => "2345", :action => "sort")
    end

    it "recognizes and generates #show" do
      { :get => "/projects/2345/pages/1" }.should route_to(:controller => "pages", :project_id => "2345", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/projects/2345/pages/1/edit" }.should route_to(:controller => "pages", :project_id => "2345", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/projects/2345/pages" }.should route_to(:controller => "pages", :project_id => "2345", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/projects/2345/pages/1" }.should route_to(:controller => "pages", :project_id => "2345", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/projects/2345/pages/1" }.should route_to(:controller => "pages", :project_id => "2345", :action => "destroy", :id => "1")
    end

  end
end
