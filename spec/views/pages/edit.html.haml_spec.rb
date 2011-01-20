require 'spec_helper'

describe "pages/edit.html.haml" do
  before(:each) do
    @page = assign(:page, john_q(:page, :new_record? => false,
        :title => "MyString",
        :html => "MyText"
    ))



  end
  it "renders the edit page form" do
    render

    rendered.should have_selector("form", :action => "/pages/#{john_q(:page).id}", :method => "post") do |form|
      form.should have_selector("input#page_title", :name => "page[title]")
      form.should have_selector("textarea#page_html", :name => "page[html]")
    end
  end
end
