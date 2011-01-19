require 'spec_helper'

describe "projects/index.html.haml" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Project,
        :name => "Name",
        :description => "Description"
      )
    ])
    controller.stub(:current_user) { User.guest }
    controller.stub(:current_ability) { User.guest }

  end

  it "renders a list of projects" do

    render
    rendered.should have_selector("span.field_value", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("span.field_value", :content => "Description".to_s, :count => 2)
  end
end
