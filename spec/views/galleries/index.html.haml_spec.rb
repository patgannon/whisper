require 'spec_helper'

describe "galleries/index.html.haml" do
  before(:each) do
    assign(:galleries, [
      stub_model(Gallery,
        :name => "Name"
      ),
      stub_model(Gallery,
        :name => "Name"
      )
    ])
    stub_ability
  end

  it "renders a list of galleries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
