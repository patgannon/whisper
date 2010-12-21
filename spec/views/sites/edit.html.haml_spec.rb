require 'spec_helper'

describe "sites/edit.html.haml" do
  before(:each) do
    @site = assign(:site, john_q(:site, :new_record? => false,
        :domain => "MyString",
        :title => "MyString",
        :body => "MyText"
    ))



  end
  it "renders the edit site form" do
    render

    rendered.should have_selector("form", :action => "/sites/#{john_q(:site).id}", :method => "post") do |form|
      form.should have_selector("input#site_domain", :name => "site[domain]")
      form.should have_selector("input#site_title", :name => "site[title]")
      form.should have_selector("textarea#site_body", :name => "site[body]")
    end
  end
end
