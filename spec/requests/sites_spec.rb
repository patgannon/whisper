require 'spec_helper'

describe "Sites" do
  describe "GET /sites" do
    before :each do
      Devise::OmniAuth.short_circuit_authorizers!
      # stub_omniauth_path(view)      
    end
    after :each do
      Devise::OmniAuth.unshort_circuit_authorizers!
    end
      
    it "works! (now write some real specs)" do
      get sites_path
    end
  end
end
