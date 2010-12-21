require 'spec_helper'

describe "Sites" do
  describe "GET /sites" do
    before :each do
      stub_omniauth_path(view)      
    end
    it "works! (now write some real specs)" do
      get sites_path
    end
  end
end
