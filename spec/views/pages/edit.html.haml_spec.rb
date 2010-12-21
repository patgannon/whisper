require 'spec_helper'

describe "pages/edit.html.haml" do
  before(:each) do
    @page = assign(:page, john_q(:page, :new_record? => false,
        :path_fragment => "MyString",
        :name => "MyString",
        :title => "MyString",
        :body => "MyText",
        :css => "MyText"
    ))



  end
  it "renders the edit page form" do
    render

    rendered.should have_selector("form", :action => "/pages/#{john_q(:page).id}", :method => "post") do |form|
      form.should have_selector("input#page_path_fragment", :name => "page[path_fragment]")
      form.should have_selector("input#page_name", :name => "page[name]")
      form.should have_selector("input#page_title", :name => "page[title]")
      form.should have_selector("textarea#page_body", :name => "page[body]")
      form.should have_selector("textarea#page_css", :name => "page[css]")
    end
  end
end
