require 'spec_helper'

describe "sites/index.html.haml" do
  before(:each) do
    assign(:sites, [
      stub_model(Site,
        :domain => "Domain",
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Site,
        :domain => "Domain",
        :title => "Title",
        :body => "MyText"
      )
    ])

  end

  it "renders a list of sites" do

    render
    rendered.should have_selector("span.field_value", :content => "Domain".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "MyText".to_s, :count => 2)
  end
end
