require 'spec_helper'

describe "projects/edit.html.haml" do
  before(:each) do
    @project = assign(:project, john_q(:project, :new_record? => false,
        :name => "MyString",
        :description => "MyText"
    ))



  end
  it "renders the edit project form" do
    render

    rendered.should have_selector("form", :action => "/projects/#{john_q(:project).id}", :method => "post") do |form|
      form.should have_selector("input#project_name", :name => "project[name]")
      form.should have_selector("textarea#project_description", :name => "project[description]")
    end
  end
end
