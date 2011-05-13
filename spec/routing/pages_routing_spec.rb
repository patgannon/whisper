require "spec_helper"

describe PagesController do
  describe "routing" do
    
    it "Captures unrecognized routes as web page paths" do
      { :get => "/Home" }.should route_to(:controller => "pages", :title1 => "Home", :action => "show")
      { :get => "/Home/About-Us" }.should route_to(:controller => "pages", :title1 => "Home", :title2=>"About-Us", :action => "show")
    end

    it "recognizes and generates #index" do
      { :get => "/pages" }.should route_to(:controller => "pages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pages/new" }.should route_to(:controller => "pages", :action => "new")
    end

    it "recognizes and generates #sort" do
      { :post => "/pages/sort" }.should route_to(:controller => "pages", :action => "sort")
    end

    it "recognizes and generates #show" do
      { :get => "/pages/1" }.should route_to(:controller => "pages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pages/1/edit" }.should route_to(:controller => "pages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pages" }.should route_to(:controller => "pages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pages/1" }.should route_to(:controller => "pages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pages/1" }.should route_to(:controller => "pages", :action => "destroy", :id => "1")
    end

  end
end
