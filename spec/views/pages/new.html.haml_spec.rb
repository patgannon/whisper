require 'spec_helper'

describe "pages/new.html.haml" do
  before(:each) do


    @page = assign(:page, stub_model(Page,
      :path_fragment => "MyString",
      :name => "MyString",
      :title => "MyString",
      :body => "MyText",
      :css => "MyText"
    ).as_new_record)
  end

  it "renders new page form" do
    render

    rendered.should have_selector("form", :action => pages_path, :method => "post") do |form|
      form.should have_selector("input#page_path_fragment", :name => "page[path_fragment]")
      form.should have_selector("input#page_name", :name => "page[name]")
      form.should have_selector("input#page_title", :name => "page[title]")
      form.should have_selector("textarea#page_body", :name => "page[body]")
      form.should have_selector("textarea#page_css", :name => "page[css]")
    end
  end
end
