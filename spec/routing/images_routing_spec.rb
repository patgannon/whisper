require "spec_helper"

describe ImagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/galleries/2345234/images" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/galleries/2345234/images/new" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/galleries/2345234/images/1" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/galleries/2345234/images/1/edit" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/galleries/2345234/images" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/galleries/2345234/images/1" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/galleries/2345234/images/1" }.should route_to(:controller => "images", :gallery_id => "2345234", :action => "destroy", :id => "1")
    end

  end
end
