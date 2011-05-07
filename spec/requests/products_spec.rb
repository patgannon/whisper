require 'spec_helper'

describe "Products" do
  before(:each) do
    @test_project = Project.new(:layout => 'norcalfreediving')
    @test_project.stub(:pages){Array.new}
    @test_project.stub(:products) {
      pageable(
        stub_model(Product,
                :name => "Name",
                :price => "Price"
              ),
              stub_model(Product,
                :name => "Name",
                :price => "Price"
              )    
    )}
    
    Project.stub(:default) {@test_project}
  end

  describe "GET /products" do
    it "works! (now write some real specs)" do
      pending "need to figure out how to sign in."
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get products_path
      response.status.should be(200)
    end
  end
end
