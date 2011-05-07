require 'spec_helper'
require 'net/http'

describe Product do
  it {should belong_to(:project)}
  it {should_not accept_values_for(:project, nil)}
  
  describe "paypal url" do
    before(:each) do
      mock_project :paypal_email_address => 'dopesauce@speakers.com'
      @product = Product.new(:name=>'Dope Speakers', 'price' => '$24.21', :project => mock_project)
    end
    
    it "should give a paypal url" do
      mock_project.stub(:paypal_sandbox) {false}
      @product.buy_now_url('/').should be == "https://www.paypal.com/cgi-bin/webscr?amount_1=%2424.21&business=dopesauce%40speakers.com&cmd=_cart&item_name_1=Dope+Speakers&quantity_1=1&return=%2F&upload=1"
    end
  
    it "should give a sandbox url appropriately." do
      mock_project.stub(:paypal_sandbox) {true}
      uri = URI.parse(@product.buy_now_url('/'))
      uri.host.should be == 'www.sandbox.paypal.com'
    end
  end
end
