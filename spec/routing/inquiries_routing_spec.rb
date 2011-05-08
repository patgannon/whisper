require "spec_helper"

describe InquiriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/inquiries" }.should route_to(:controller => "inquiries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inquiries/new" }.should route_to(:controller => "inquiries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inquiries/1" }.should route_to(:controller => "inquiries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inquiries/1/edit" }.should route_to(:controller => "inquiries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inquiries" }.should route_to(:controller => "inquiries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/inquiries/1" }.should route_to(:controller => "inquiries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inquiries/1" }.should route_to(:controller => "inquiries", :action => "destroy", :id => "1")
    end

  end
end
