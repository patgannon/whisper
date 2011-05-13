require "spec_helper"

describe DomainNamesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/domain_names" }.should route_to(:controller => "domain_names", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/domain_names/new" }.should route_to(:controller => "domain_names", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/domain_names/1" }.should route_to(:controller => "domain_names", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/domain_names/1/edit" }.should route_to(:controller => "domain_names", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/domain_names" }.should route_to(:controller => "domain_names", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/domain_names/1" }.should route_to(:controller => "domain_names", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/domain_names/1" }.should route_to(:controller => "domain_names", :action => "destroy", :id => "1")
    end

  end
end
