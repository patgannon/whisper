require 'spec_helper'

describe "pages/new.html.haml" do
  before(:each) do


    @page = assign(:page, stub_model(Page,
      :title => "MyString",
      :html => "MyText"
    ).as_new_record)
  end

  it "renders new page form" do
    render

    rendered.should have_selector("form", :action => pages_path, :method => "post") do |form|
      form.should have_selector("input#page_title", :name => "page[title]")
      form.should have_selector("textarea#page_html", :name => "page[html]")
    end
  end
end
