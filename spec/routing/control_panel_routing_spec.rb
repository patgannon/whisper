require "spec_helper"

describe ControlPanelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/control_panel" }.should route_to(:controller => "control_panels", :action => "index")
    end
  end
end
