require "spec_helper"

describe PageElementsController do
  describe "routing" do
    
    it "recognizes and generates #index" do
      { :get => "/pages/234/elements" }.should route_to(:controller => "page_elements", :action => "index", :page_id => '234')
    end

    it "recognizes and generates #new" do
      { :get => "/pages/234/elements/new" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "new")
    end

    it "recognizes and generates #sort" do
      { :post => "/pages/234/elements/sort" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "sort")
    end

    it "recognizes and generates #show" do
      { :get => "/pages/234/elements/1" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pages/234/elements/1/edit" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pages/234/elements" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pages/234/elements/1" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pages/234/elements/1" }.should route_to(:controller => "page_elements", :page_id => '234', :action => "destroy", :id => "1")
    end

  end
end
