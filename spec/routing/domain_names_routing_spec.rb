require "spec_helper"

describe DomainNamesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/projects/12345/domain_names" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/projects/12345/domain_names/new" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/projects/12345/domain_names/1" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/projects/12345/domain_names/1/edit" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/projects/12345/domain_names" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/projects/12345/domain_names/1" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/projects/12345/domain_names/1" }.should route_to(:controller => "domain_names", :project_id => "12345", :action => "destroy", :id => "1")
    end

  end
end
