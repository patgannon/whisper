require 'spec_helper'

describe "projects/new.html.haml" do
  before(:each) do


    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    rendered.should have_selector("form", :action => projects_path, :method => "post") do |form|
      form.should have_selector("input#project_name", :name => "project[name]")
      form.should have_selector("textarea#project_description", :name => "project[description]")
    end
  end
end
