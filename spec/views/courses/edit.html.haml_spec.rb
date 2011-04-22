require 'spec_helper'

describe "courses/edit.html.haml" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :name => "MyString",
      :description => "MyText",
      :cost => "",
      :published => false
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path(@course), :method => "post" do
      assert_select "input#course_name", :name => "course[name]"
      assert_select "textarea#course_description", :name => "course[description]"
      assert_select "input#course_cost", :name => "course[cost]"
      assert_select "input#course_published", :name => "course[published]"
    end
  end
end
