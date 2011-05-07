require 'spec_helper'

describe "products/index.html.haml" do
  before(:each) do
    assign(:products, pageable(stub_model(Product,
        :name => "Name",
        :price => "Price",
        :project => mock_project
      ),
      stub_model(Product,
        :name => "Name",
        :price => "Price",
        :project => mock_project
      )))
  end

  it "renders a list of products" do
    pending "need to figure out how to sign in."
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Price".to_s, :count => 2
  end
end
