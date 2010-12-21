require 'spec_helper'

describe "pages/index.html.haml" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :path_fragment => "Path Fragment",
        :name => "Name",
        :title => "Title",
        :body => "Body",
        :css => "Css"
      ),
      stub_model(Page,
        :path_fragment => "Path Fragment",
        :name => "Name",
        :title => "Title",
        :body => "Body",
        :css => "Css"
      )
    ])

  end

  it "renders a list of pages" do

    render
    rendered.should have_selector("span.field_value", :content => "Path Fragment".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Body".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Css".to_s, :count => 2)
  end
end
